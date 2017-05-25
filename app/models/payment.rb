class Payment < ActiveRecord::Base

  require 'base64'

  # Virtual attributes (non-saved)
  attr_accessor :credit_card_number
  attr_accessor :expiration_year
  attr_accessor :expiration_month

  # Relationships
  has_one :payback
  belongs_to :payee, class_name: "User", foreign_key: "payee_id"
  belongs_to :payer, class_name: "User", foreign_key: "payer_id"
  belongs_to :fundraiser

  # Scopes
  scope :for_fundraiser, ->(fundraiser_id) { where(fundraiser_id: fundraiser_id) }
  scope :for_user,       ->(user_id) { where(user_id: user_id) }

  # Methods
  def pay
    return false unless self.payment_receipt.nil?
    generate_payment_receipt
    self.save!
    self.payment_receipt
  end

  def credit_card_type
    credit_card.type.nil? ? "N/A" : credit_card.type.name
  end

end
