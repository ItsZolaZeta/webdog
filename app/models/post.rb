class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { maximum: 150 }
  validates :body,  presence: true, length: { maximum: 2000 }

  paginates_per 6
end
