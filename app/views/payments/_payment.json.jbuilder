json.extract! payment, :id, :payee_id, :payer_id, :fundraiser_id, :amount, :message, :payment_receipt, :date, :created_at, :updated_at
json.url payment_url(payment, format: :json)
