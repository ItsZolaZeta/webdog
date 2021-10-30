class Blogpost < ApplicationRecord
  belongs_to :user

  validates :title, presence: true, length: { maximum: 100 }
  validates :body,  presence: true
  validates :meta, presence: true, length: {maximum: 300}

  paginates_per 6
end
