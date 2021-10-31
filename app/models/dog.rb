class Dog < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :breed, presence: true, inclusion: { in: ['German Shepherd', 'Swiss White Shepherd', 'Australian Shepherd', 
                                      'Goldren Retriever', 'Labrador Retriever', 'Husky', 'Chihuahua', 'Poodle', 'Mixed'] }
  validates :gender, presence: true, inclusion: { in: ['Male', 'Female'] }

  mount_uploader :photo, DogAvatarUploader

end
