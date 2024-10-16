class MainPagesController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザーのみアクセス可能

  # def show
  # end

  def index
    @posts = Post.all.order(created_at: :desc) # 投稿を作成日時でソートして一覧表示
  end

  # メニューページの表示（例: ログイン後のユーザーに特定の機能を提供する）
  def menu
    # メニューページはログインしたユーザーのみアクセス可能
    redirect_to new_user_session_path unless user_signed_in?
  end
end
