require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "valid message" do
    sender = User.new name: 'new', email: 'new@gmail.com', password: 'pw'
    sender.save!

    receiver = User.new name: 'old', email: 'old@gmail.com', password: 'pw'
    receiver.save!

    convo = Conversation.new sender: sender, recipient: receiver
    convo.save!

    message = Message.new conversation: convo, user: sender, body: "Hello"
    message.save!

    assert_equal convo.messages.all.first, message
    assert_equal sender.messages.all.first, message
    refute_equal receiver.messages.all.first, message
  end

  test "message body can't be empty" do
    sender = User.new name: 'new', email: 'new@gmail.com', password: 'pw'
    sender.save!

    receiver = User.new name: 'old', email: 'old@gmail.com', password: 'pw'
    receiver.save!

    convo = Conversation.new sender: sender, recipient: receiver
    convo.save!

    message = Message.new conversation: convo, user: sender, body: ""
    refute message.valid?
  end
end
