class PostsController < ApplicationController
  before_action :authenticate_user! # ログインしているユーザーのみアクセス可能

  # 投稿一覧ページ（メインページ）の表示
  def index
    @posts = Post.includes(:user).order(created_at: :desc)
  end

  # 新規投稿作成ページの表示
  def new
    @post = Post.new
  end

  # 投稿の保存処理
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to main_path, notice: "投稿が作成されました。"
    else
      flash.now[:alert] = "すべてのフィールドを入力してください。"
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to main_path, notice: "投稿が削除されました。"
  end

  private

  def post_params
    params.require(:post).permit(:title, :sake_name, :taste_rating)
  end
end
