class OrganizationUser < ActiveRecord::Base

	# Relationships
	has_one :organization
	has_one :user

end
