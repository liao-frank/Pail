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

  # Scopes

end
