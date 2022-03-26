class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.integer :post_id, foreign_key: true
      t.integer :tag_id, foreign_key: true

      t.timestamps
    end
  end
end
