class AddNameToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :username, :string, null: false, unique: true
  end
end
