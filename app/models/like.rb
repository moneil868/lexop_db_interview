class Like < ApplicationRecord
  belongs_to :article

  def increase_count(num)
    self.count += num
    self.save!
  end
end
