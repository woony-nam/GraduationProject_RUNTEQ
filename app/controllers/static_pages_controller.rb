class StaticPagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:top, :age_verification]

  def top
  end

  def age_verification
    # 年齢確認ページの処理
  end

  def new_user_registration
    # 新規登録ページの処理
  end

  def new_user_session
    # ログインページの処理
  end

  def main
    # メインページの処理
  end
end
