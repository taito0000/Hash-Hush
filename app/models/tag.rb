class Tag < ApplicationRecord
  before_save :downcase_name
  
  validates :name, presence: true, length: { maximum: 30 }
  has_many :post_tags, dependent: :destroy
  has_many :posts, through: :post_tags
  has_many :follow_tags, dependent: :destroy
  has_many :users, through: :follow_tags
  
  private

    def downcase_name
      self.name.downcase!
    end
end
