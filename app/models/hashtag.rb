class Hashtag < ApplicationRecord
  validates :name, presence: true, length: { maximum: 30 }
  has_many :post_hashtags, dependent: :destroy
  has_many :posts, through: :post_hashtags
  has_many :follow_hashtags, dependent: :destroy
  has_many :users, through: :follow_hashtags
end
