require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'post cannot be empty' do
    post = Post.new 
    refute post.valid?
  end

  test 'body cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new  title: 'Hello', user: user
    refute post.valid?
  end

  test 'title cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new  body: 'Hello', user: user
    refute post.valid?
  end

  test 'user cannot be empty' do
    post = Post.new title: 'Hello', body: 'body text'
    refute post.valid?
  end

  test 'valid post' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'Hello', body: 'body text', user: user
    post.save!
    assert_equal(post, Post.all.first)
  end

  test 'title too long' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello', body: 'body text', user: user
    refute post.valid?
  end
end
