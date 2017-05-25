class Organization < ActiveRecord::Base

	# Relationships
	has_one :organization_user
	has_one :orgnaization

	# Validations
	validates :organization_not_a_duplicate, on :create

	def already_exists? # Function to check if the organization exists in the database
		Organization.where(:name=self) == 1 # Access the database for any organizations with the name, if there exists one already, returns true
	end

	def organization_not_a_duplicate # Function to be called for validation
		return true if self.name.nil? # Checks if the name is empty
		if self.already_exists? # Check if a duplicate
			errors.add(:name, " already exists as an organization")
		end
	end
end
