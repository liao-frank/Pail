class HomeController < ApplicationController
	def home
		@payments = Payment.chronological.to_a.take(10)
		@fundraisers = Fundraiser.chronological.to_a.take(10)
	end

	def about
	end

	def privacy
	end

	def sandbox
	end

	def contact
	end
end
