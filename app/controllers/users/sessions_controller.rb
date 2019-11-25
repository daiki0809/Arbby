# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController

  before_action :user_destroy_check, only: [:create]
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

  private

  def user_destroy_check
    user = User.only_deleted.find_by(email: params[:user][:email])
    if user != nil
      flash[:notice] = "このアカウントは凍結されています。"
      redirect_to new_user_session_path
    end
  end

  def after_sign_in_path_for(resource)
        hobbies_path
  end

  def after_sign_out_path_for(resource)
        new_user_session_path
  end
end
