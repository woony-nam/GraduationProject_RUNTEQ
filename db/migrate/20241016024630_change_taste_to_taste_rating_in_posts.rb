class ChangeTasteToTasteRatingInPosts < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :taste, :integer # tasteカラムを削除
    add_column :posts, :taste_rating, :integer, null: false # taste_ratingカラムを追加
  end
end
