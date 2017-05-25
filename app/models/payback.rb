class Payback < ActiveRecord::Base

	# Relationships
	has_one :payment

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
		payer = p.find(payer_id) # Extract the payer User
		payee = p.find(payee_id) # Extract the payee User
		payer.funds+= amount # Add the funds back to the payer, since it's a refund
		payee.funds-= amount # Subtract the funds from the payee, since they're no longer in control of the funds
	end
	
end
