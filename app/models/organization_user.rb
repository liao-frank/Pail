class OrganizationUser < ActiveRecord::Base

	# Relationships
	belongs_to :organization
	belongs_to :user
	has_many :messages

	scope :for_user, -> (user_id) { where(user_id: user_id) }
	scope :for_organization, ->(org_id){ where(org_id: org_id) }

end
