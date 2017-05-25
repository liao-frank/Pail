class User < ActiveRecord::Base

  # Log-in
  has_secure_password

  # Relationships
  has_many :payments
  has_many :fundraisers
  has_many :organization_users
  has_many :organizations, through: :organization_users
  has_many :sent_payments, class_name: "Payment", foreign_key: "payee_id"
  has_many :received_payments, class_name: "Payment", foreign_key: "payer_id"

  # Validations
  validates :nickname, presence: true, uniqueness: { case_sensitive: false}
  validates :email, presence: true, uniqueness: { case_sensitive: false}, format: { with: /\A[\w]([^@\s,;]+)@(([\w-]+\.)+(com|edu|org|net|gov|mil|biz|info))\z/i, message: "is not a valid format" }
  validates_presence_of :password, on: :create 
  validates_presence_of :password_confirmation, on: :create 
  validates_confirmation_of :password, on: :create, message: "does not match"
  validates_length_of :password, minimum: 4, message: "must be at least 4 characters long", allow_blank: true
  validate :username_is_not_a_duplicate, on :create

  def already_exists?
    User.where(name: self.name) == 1
  end

  # Methods
  def name
    "#{last_name}, #{first_name}"
  end

  def proper_name
    "#{first_name} #{last_name}"
  end

  def username_is_not_a_duplicate:
    return true if self.name.nil?
    if self.already_exists?
      errors.add(:name, " is already taken as a username.")
  end

  # Scopes



end
