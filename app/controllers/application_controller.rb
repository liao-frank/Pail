class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	private
	def current_user
		@current_user ||= User.find(session[:user_id]) if session[:user_id]
	end
	helper_method :current_user

	def logged_in?
		current_user
	end
	helper_method :logged_in?

	def check_login
		redirect_to login_url, alert: "You need to log in to view this page." if current_user.nil?
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
	helper_method :getUserImagePath

	def getFundraiserImagePath(fundraiser_name) # Obtain file path for a fundraiser's profile image
		if Rails.application.assets.find_asset FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.jpg"
			return FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.jpg"
		elsif Rails.application.assets.find_asset FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.png"
			return FUNDRAISER_NAME_DIR + "/#{fundraiser_name}.png"
		else
			return FUNDRAISER_NAME_DIR + "/no-image.jpg"
		end
	end
	helper_method :getFundraiserImagePath
	
end
