class UsersController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  before_action :set_user, only: [:destroy]

  def show
    @user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to menus_path, notice: 'アカウント情報が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    if @user == current_user
      @user.destroy
      flash[:notice] = 'アカウントが削除されました。'
      redirect_to root_path # static_pageにリダイレクト
    else
      flash[:alert] = '削除権限がありません。'
      redirect_to edit_user_path(current_user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end

  protected

  # Deviseにカスタムパラメーターを許可
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [ :username ])
    devise_parameter_sanitizer.permit(:account_update, keys: [ :username ])
  end
end
