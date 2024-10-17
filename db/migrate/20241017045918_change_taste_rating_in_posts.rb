class ChangeTasteRatingInPosts < ActiveRecord::Migration[7.2]
  def change
    # 既存のtaste_rating列を削除
    remove_column :posts, :taste_rating, :integer, null: false

    # 新しいtaste_rating列を追加（ユニーク制約とnull制約を追加）
    add_column :posts, :taste_rating, :integer, null: false

  
  end
end