require 'test_helper'

class BlogpostTest < ActiveSupport::TestCase
  test 'blogpost cannot be empty' do
    blogpost = Blogpost.new 
    refute blogpost.valid?
  end

  test 'body cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    blogpost = Blogpost.new  title: 'Hello', meta: 'something', user: user
    refute blogpost.valid?
  end

  test 'title cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    blogpost = Blogpost.new  meta: 'something', body: 'Hello', user: user
    refute blogpost.valid?
  end

  test 'meta cannot be empty' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    blogpost = Blogpost.new  title: 'Hello', body: 'Hello', user: user
    refute blogpost.valid?
  end

  test 'user cannot be empty' do
    blogpost = Blogpost.new title: 'Hello', meta: 'something', body: 'body text'
    refute blogpost.valid?
  end

  test 'valid blogpost' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    blogpost = Blogpost.new title: 'Hello', meta: 'soemthing', body: 'body text', user: user
    blogpost.save!
    assert_equal(blogpost, Blogpost.all.first)
  end

  test 'title too long' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    blogpost = Blogpost.new title: 'Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello Hello', meta: 'something', body: 'body text', user: user
    refute blogpost.valid?
  end
end
