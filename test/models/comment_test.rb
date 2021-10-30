require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test 'comment cannot be empty' do
    comment = Comment.new 
    refute comment.valid?
  end

  test 'body cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    comment = Comment.new user: user
    refute comment.valid?
  end

  test 'user cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'Hello', body: 'body text', user: user
    post.save!
    comment = Comment.new body: 'body text', post: post
    refute comment.valid?
  end

  test 'post cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    comment = Comment.new body: 'body text', user: user
    refute comment.valid?
  end

  test 'valid comment' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'Hello', body: 'body text', user: user
    post.save!
    comment = Comment.new body: 'body text', user: user, post: post
    comment.save!
    assert_equal(comment, Comment.all.first)
  end

  test 'comment on post of others' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    author = User.new name: 'Oana', email: 'oana@gmail.com', password: 'pw'
    author.save!
    post = Post.new title: 'Hello', body: 'body text', user: author
    post.save!
    comment = Comment.new body: 'body text', user: user, post: post
    comment.save!
    assert_equal(post.comments.first, comment)
  end
end
