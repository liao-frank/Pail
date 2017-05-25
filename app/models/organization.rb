class Organization < ActiveRecord::Base

	# Relationships
	has_one :organization_user
	has_one :orgnaization
end
