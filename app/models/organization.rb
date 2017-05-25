class Organization < ActiveRecord::Base

	# Relationships
	has_many :organization_users
	has_one :orgnaization

	# Validations
	validates :organization_not_a_duplicate, on: :create


	def already_exists? # Function to check if the organization exists in the database
		Organization.where(name: self.name) == 1 # Access the database for any organizations with the name, if there exists one already, returns true
	end

	def organization_not_a_duplicate # Function to be called for validation
		return true if self.name.nil? # Checks if the name is empty
		if self.already_exists? # Check if a duplicate
			errors.add(:name, " already exists as an organization")
		end
	end

	def list_of_members
		nicknames = Array.new # Create a container for the nicknames of the members
		members = self.organization_users # Grab the users for the organization
		members.each do |member| # Go through each member
			nicknames += member.user.nickname # Add the member's nickname from the User model to the nicknames container
	end
end
