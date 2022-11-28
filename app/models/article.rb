class Article < ApplicationRecord
  has_many :likes
  validates :title, :excerpt, :author, :publication_date, :category, presence: true
  validates_uniqueness_of :title

  def highest_like_count_day
    likes.pluck(:count).max
  end

  def total_likes
    likes.pluck(:count).sum
  end
end
