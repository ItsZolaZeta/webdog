class Message < ApplicationRecord
  belongs_to :user
  belongs_to :conversation

  validates :body, presence: true

  # calls message_broadcase_job.rb perform function, after a Message record has been created
  after_create_commit { MessageBroadcastJob.perform_later(self) }
end
