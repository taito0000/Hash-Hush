class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :body
      t.string :image_id
      t.integer :user_id
      t.text :tagbody

      t.timestamps
    end
  end
end
