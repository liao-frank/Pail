class OrganizationUser < ActiveRecord::Base

	# Relationships
	belongs_to :organization
	belongs_to :user
	has_many :messages

	scope :for_organization, ->(org_id){ where(org_id: org_id) }

end
