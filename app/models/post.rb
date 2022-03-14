class Post < ApplicationRecord
    belongs_to :user
    has_many :post_hashtags, dependent: :destroy
    has_many :hashtags, through: :post_hashtags
    has_many :comments, dependent: :destroy
    has_many :favorites, dependent: :destroy
    
    def favorited_by?(user)
      favorites.where(user_id: user.id).exists?
    end
    attachment :image
    
    after_create do
      post = Post.find_by(id: id)
      hashtags = hashbody.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
      hashtags.uniq.map do |hashtag|
        tag = Hashtag.find_or_create_by(name: hashtag.downcase.delete('#'))
        post.hashtags << tag
      end
    end
end
