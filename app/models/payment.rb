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
  scope :for_fundraiser,  ->(fundraiser_id) { where(fundraiser_id: fundraiser_id) }
  scope :for_payee,       ->(payee_id) { where(payee_id: payee_id) }
  scope :for_payer,       ->(payer_id) { where(payer_id: payer_id) }
  scope :chronological,   -> { order(date: :desc) }
  scope :by_id,           -> { order(id: :asc) }
  scope :personal,        -> { where(fundraiser_id: nil)}
  scope :fundraiser,      -> { where.not(fundraiser_id: nil) }

  validates :payer_id, numericality: { only_integer: true }
  validates :payee_id, numericality: { only_integer: true }
  validates_numericality_of :amount, greater_than: 0
  validate :check_negative_balance

  before_create :add_raised_for_event

  # Methods
  def pay
    return false unless self.payment_receipt.nil?
    self.payment_receipt = Base64.encode64("payment: #{self.id}; amount_paid: #{self.amount}; payee: #{self.payee_id}; payer: #{self.payer_id}")
    self.save!
  end

  def paid
    !payment_receipt.nil?
  end

  def credit_card_type
    credit_card.type.nil? ? "N/A" : credit_card.type.name
  end

  def is_paid_back
    #returns true if paid back, false if not
    !Payback.for_payment(self.id).empty?
  end

  def add_raised_for_event
    unless self.fundraiser_id.nil?
      fundraiser = Fundraiser.find(self.fundraiser_id)
      unless fundraiser.raised >= fundraiser.goal
        fundraiser.update_attribute(:raised, fundraiser.raised + self.amount)
      end
    end
  end

  private

  def check_negative_balance
    payer_funds = User.find(self.payer_id).funds
    if payer_funds - self.amount < 0
      errors.add(:payer_id, "does not have enough funds.")
    else
      return true
    end
  end

end
