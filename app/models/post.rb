class Post < ApplicationRecord
  belongs_to :user
  has_many :post_tags, dependent: :destroy
  has_many :tags, through: :post_tags
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  attachment :image
  
  def save_tags(tag_list)
    tag_list.each do |tag|
      target_tag = Tag.find_by(name:tag)
      if  target_tag
        PostTag.create!({post_id:self.id,tag_id:target_tag.id})
      else
        created_tag = Tag.create!(name:tag)
        PostTag.create!({post_id:self.id,tag_id:created_tag.id})
      end
    end
  end
end
