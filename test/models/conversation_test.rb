require 'test_helper'

class ConversationTest < ActiveSupport::TestCase
  test "conversation between 2 registered users" do
    sender = User.new name: 'new', email: 'new@gmail.com', password: 'pw'
    sender.save!

    receiver = User.new name: 'old', email: 'old@gmail.com', password: 'pw'
    receiver.save!

    convo = Conversation.new sender: sender, recipient: receiver
    convo.save!

    assert_equal Conversation.all.first, convo
  end
end
