class ApplicationController < ActionController::Base
	before_action :authenticate_request!
  
  def authenticate_request!
    unless session[:user_id]
    	@user = ''
    	redirect_to root_path
    else
    	@user = User.find(session[:user_id])
      # @user = Api.new.get_user(session[:auth_token])
    end
  end

end
