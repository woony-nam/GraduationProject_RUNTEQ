class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :sake_name, null: false
      t.integer :taste_rating, null: false
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
