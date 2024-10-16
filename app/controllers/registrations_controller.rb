class RegistrationsController < Devise::RegistrationsController
  # skip_before_action :require_no_authentication, only: [ :new, :create ]

  # def create
  #   super
  # end

  def new
    super
  end

  private

  def sign_up_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :current_password)
  end
end
