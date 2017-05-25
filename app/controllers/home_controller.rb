class HomeController < ApplicationController
	def home
		@payments = Payment.chronological.to_a.take(10)
		@fundraisers = Fundraiser.chronological.to_a.take(5)
	end

	def about
	end

	def privacy
	end

	def sandbox
	end

	def contact
	end

	private
	# Constants
	FUNDRAISER_NAME_DIR = "fundraisers" # Path constant
	USERIMAGE_DIR = "user-images" # Path constant

	def getUserImagePath(username) # Obtain file path for a user's profile image
		if Rails.application.assets.find_asset USERIMAGE_DIR + "/#{username}.jpg"
			return USERIMAGE_DIR + "/#{username}.jpg"
		elsif Rails.application.assets.find_asset USERIMAGE_DIR + "/#{username}.png"
			return USERIMAGE_DIR + "/#{username}.png"
		else
			return USERIMAGE_DIR + "/no-image.jpg"
		end
	end

	def getFundraiserImagePath(fundraiser_name) # Obtain file path for a fundraiser's profile image
		if Rails.application.assets.find_asset FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.jpg"
			return FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.jpg"
		elsif Rails.application.assets.find_asset FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.png"
			return FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.png"
		else
			return FUNDRAISER_NAME_DIR + "/no-image.jpg"
		end
	end

	def getImage(username) # Returns path to the image
		username + ".jpg"
	end
	helper_method :getImage
end
