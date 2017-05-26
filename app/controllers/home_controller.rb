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

  def search
    @query = params[:query]
    @fundraisers = Fundraiser.search(@query)
    @users = User.search(@query)
		@organizations = Organization.search(@query)
    @total_hits = @fundraisers.size + @users.size + @organizations.size
  end

end
