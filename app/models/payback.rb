class Payback < ActiveRecord::Base

	# Relationships
	has_one :payment

	# Scope
	scope :for_payment, ->(payment_id) { where(payment_id: payment_id) }

	# Other methods
	def get_amount(payment_id) # Find the amount to pay back
		p = Payment.find(payment_id) # Use the payment database to find the payment
		amount = p.amount # Extract the amount from the payment
		return amount # Return the payment
	end

	def payback(amount, payment_id) # Execute payback of money
		p = Payment.find(payment_id) # Use the payment ID to find the transaction
		payer_id = p.payer_id # Extract the payer ID
		payee_id = p.payee_id # Extract the payee ID
		payer = User.find(payer_id) # Extract the payer from the User database using the payer_id
		payee = User.find(payee_id) # Extract the payee from the User database using the payee_id
		payer.funds+= amount # Add the funds back to the payer, since it's a refund
		payee.funds-= amount # Subtract the funds from the payee, since they're no longer in control of the funds
		payer.save! # save the funds changes
		payee.save! # save the funds changes
	end

end
