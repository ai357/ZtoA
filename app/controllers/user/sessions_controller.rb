# frozen_string_literal: true

class User::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  
  
  
  before_action :user_state, only: [:create]


  protected

  def user_state
    @user = User.find_by(email: params[:user][:email])
    return if !@user

    if @user.valid_password?(params[:customer][:password])
      if @user.is_deleted == true
        redirect_to new_user_registration_path
      else @user.is_deleted == false
      end
    end
  end
  
end
