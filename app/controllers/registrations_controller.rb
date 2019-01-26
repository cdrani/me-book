# frozen_string_literal: true

class RegistrationsController < Devise::RegistrationsController
  before_action :authenticate_user!

  protected

  def after_sign_in_path_for(_resource)
    "/#{current_user.user_name}"
  end

  private

  def sign_up_params
    params.require(:user).permit(:user_name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:user_name,
                                 :email,
                                 :password,
                                 :password_confirmation)
  end
end
