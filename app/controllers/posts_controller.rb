class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]


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

  # 投稿の詳細を表示
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    # 編集用のフォームを表示するためのアクション
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '投稿が更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to main_path, notice: "投稿が削除されました。"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def authorize_user!
    redirect_to posts_path, alert: '権限がありません。' unless current_user == @post.user
  end
  
  def post_params
    params.require(:post).permit(:title, :sake_name, :taste_rating)
  end
end
