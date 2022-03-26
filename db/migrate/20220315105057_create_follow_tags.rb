class CreateFollowTags < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_tags do |t|
      t.integer :user_id, foreign_key: true
      t.integer :tag_id, foreign_key: true
      
      t.timestamps
    end
  end
end
