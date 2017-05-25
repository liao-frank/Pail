class Fundraiser < ActiveRecord::Base

  belongs_to :user
  has_many :payments

  	# Validations
	validates :fundraiser_not_a_duplicate, on :create

	def already_exists? # Function to check if the fundraiser name exists in the database
		Fundraiser.where(name: self.name) == 1 # Access the database for any fundraisers with the name, if there exists one already, returns true
	end

	def fundraiser_not_a_duplicate # Function to be called for validation
		return true if self.name.nil? # Checks if the name is empty
		if self.already_exists? # Check if a duplicate
			errors.add(:name, " already exists as a fundraiser")
		end
	end
end
