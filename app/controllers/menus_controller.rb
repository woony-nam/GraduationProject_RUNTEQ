class MenusController < ApplicationController
  before_action :authenticate_user!

  def index
    @user_posts = current_user.posts # ユーザーの投稿を取得
  end
end
