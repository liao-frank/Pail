class Fundraiser < ActiveRecord::Base

	TYPES = [['Theshold','threshold'],['Flex','flex']]
  
  # Relationships
  belongs_to :user
  has_many :payments

  # Scopes
  scope :chronological,   -> { order(start_date: :desc) }
	scope :for_user, ->(user_id) { where(owner_id: user_id) }
	scope :search, ->(term) { where('name LIKE ?', "#{term}%") }

  # Validations
	validates_date :end_date, after: :start_date, allow_blank: true
	validates_inclusion_of :category, in: %w[threshold flex], message: "must be either theshold or flex"
	validates_numericality_of :goal, greater_than: 0, allow_blank: true
	validates_numericality_of :raised, greater_than_or_equal_to: 0
  validate :fundraiser_not_a_duplicate, on: :create

  def already_exists? # Function to check if the fundraiser name exists in the database
  		Fundraiser.where(name: self.name) == 1 # Access the database for any fundraisers with the name, if there exists one already, returns true
	end

	def fundraiser_not_a_duplicate # Function to be called for validation
		return true if self.name.nil? # Checks if the name is empty
		if self.already_exists? # Check if a duplicate
			errors.add(:name, " already exists as a fundraiser")
		end
	end

	def receive_payments
		payments = Payment.for_fundraiser(self.id) # Array for all the active record payments of all the fundraisers
		payments.each do |p| # Go through each payment that matches the fundraiser_id
			p.pay # Invoke the pay method of the Payment model
			self.user.update_attribute(:funds, self.funds + p.amount) # Update the funds of the user in control of the fundraiser/funds account
		end
	end
end