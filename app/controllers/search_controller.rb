class SearchController < ApplicationController
  def index
    @posts = Post.includes(:user) # ユーザーデータを含めて投稿を取得

    # 各フィールドに対してあいまい検索を行う
    if params[:title].present? || params[:sake_name].present? || params[:username].present?
      @posts = @posts.joins(:user) # ユーザーと結合

      # titleに対する検索条件
      if params[:title].present?
        @posts = @posts.where("title ILIKE ?", "%#{params[:title]}%")
      end

      # sake_nameに対する検索条件
      if params[:sake_name].present?
        @posts = @posts.where("sake_name ILIKE ?", "%#{params[:sake_name]}%")
      end

      # usernameに対する検索条件
      if params[:username].present?
        @posts = @posts.where("users.username ILIKE ?", "%#{params[:username]}%")
      end
    end

      @hit_count = @posts.count # ヒット数をカウント
  
      @posts = @posts.order(created_at: :desc) # 投稿を新しい順に並べる
  end
end