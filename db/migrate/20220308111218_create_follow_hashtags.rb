class CreateFollowHashtags < ActiveRecord::Migration[5.2]
  def change
    create_table :follow_hashtags do |t|
      t.integer :user_id
      t.integer :hashtag_id

      t.timestamps
    end
  end
end
