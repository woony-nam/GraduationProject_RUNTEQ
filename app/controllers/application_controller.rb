class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  # ログインやサインアップ後のリダイレクト先を指定
  def after_sign_in_path_for(resource)
    main_path # メインページのパスに変更
  end

  # サインアップ後のリダイレクト先を指定
  def after_sign_up_path_for(resource)
    main_path # メインページのパスに変更
  end
end
