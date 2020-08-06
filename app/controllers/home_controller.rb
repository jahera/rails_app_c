class HomeController < ApplicationController
	before_action :authenticate_request!, only: [:index, :user_profile]

  def index
  end

  def user_profile
  end

  def sign_up
  end

  def save_user
    @params = {:user => user_params}
    @responds = Api.new.devise_sign_up(@params, "/users")
    if @responds['status'] == 200
      redirect_to user_login_path
    else
      render json: {errors: @responds['message'] }
    end
  end

  def login
  end

  def authenticate_user
    auth = {:user => {email: params[:user][:email], password: params[:user][:password]}}
    @token = Api.new.auth_user(auth, "/users/sign_in")
    session[:auth_token] = "#{@token}"
    redirect_to root_path
  end

  def destroy
    @responds = Api.new.destroy_user(session[:auth_token], "/users/sign_out")
    session[:auth_token] = nil
    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :contact_no, :dob, :auth_token, :avatar, :organization_id)
    end
end
