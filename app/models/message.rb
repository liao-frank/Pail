class Message < ActiveRecord::Base

  # Relationships
  belongs_to :organization
  belongs_to :organization_user

  validates_numericality_of :likes

end
