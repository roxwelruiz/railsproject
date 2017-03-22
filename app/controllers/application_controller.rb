class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
  	if exception.message == "You are not authorized to remove comments."
  		redirect_to request.referrer, :alert => exception.message
  	else
  		redirect_to main_app.root_url, :alert => exception.message
  	end
  end
end
