class SessionsController < Devise::SessionsController
  # skip_before_action :require_no_authentication, only: [ :new, :create ]

  # def create
  #   super
  # end
  def new
    super
  end

  def create
    super do |user|
      redirect_to main_path if user_signed_in? # ログインが成功したらmain_pageに遷移
    end
  end
end
