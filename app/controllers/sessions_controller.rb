class SessionsController < Devise::SessionsController
  # ログインページにアクセスする前に実行されるアクション
  prepend_before_action :check_logged_in, only: [:new]

  def new
    super
  end

  def create
    super do |user|
      if user_signed_in?
        return redirect_to main_path # ログインが成功したらmain_pageに遷移し、処理を終了
      end
    end
  end

  private

  def check_logged_in
    # すでにログインしている場合、ログアウトしてから再度ログインページに遷移
    if user_signed_in?
      sign_out(current_user)
    end
  end
end
