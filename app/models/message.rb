class Message < ActiveRecord::Base

  # Relationships
  belongs_to :organization
  belongs_to :organization_user

  validates :likes, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  scope :chronological, -> { order(date_time: :desc) }

end
