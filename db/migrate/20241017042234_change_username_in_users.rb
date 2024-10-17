class ChangeUsernameInUsers < ActiveRecord::Migration[7.2]
  def change
    # 既存のusername列を削除
    remove_column :users, :username, :string

    # 新しいusername列を追加（ユニーク制約とnull制約を追加）
    add_column :users, :username, :string, null: false

    # インデックスを追加
    add_index :users, :username, unique: true
  end
end
