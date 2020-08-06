class ApplicationController < ActionController::Base
	before_action :authenticate_request!
  
  def authenticate_request!
    unless session[:auth_token]
    	@user = ''
    	redirect_to user_login_path
    else
      @user = Api.new.get_user(session[:auth_token])
    end
  end
end
