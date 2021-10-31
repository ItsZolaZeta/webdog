class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :blogpost, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_one :dog, dependent: :destroy
  
  has_many :messages
  has_many :conversations, foreign_key: :sender_id

  has_secure_password

  validates :name, presence: true, length: { maximum: 100 }
  validates :email, presence: true, uniqueness: true
  validates :role, inclusion: { in: %w(admin trainer client) }
  validates :introduction, length: { maximum: 300 }

  after_initialize :default_role!
  before_validation :downcase_email

  mount_uploader :avatar, AvatarUploader

  paginates_per 9

  private

  def default_role!
    self.role ||= 'client'
  end

  def downcase_email
    self.email = email.downcase
  end
end
