class AddUserInfoToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :nickname, :string
    add_column :users, :introduction, :text
    
    
    change_column :users, :name, :string, null: false
    change_column :users, :nickname, :string, null: false
  end
end
