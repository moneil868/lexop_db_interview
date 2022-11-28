class Like < ApplicationRecord
  belongs_to :article

  validates :date, presence: true

  def increase_count(num)
    self.count += num
    self.save!
  end
end
