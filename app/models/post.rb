class Post < ApplicationRecord
  has_rich_text :content
  has_many :comments, dependent: :destroy

  def self.popular_posts
    order(views: :desc).limit(3)
  end
end
