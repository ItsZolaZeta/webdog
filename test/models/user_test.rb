require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'email is lowercased before validation' do
    user = User.new name: 'new', email: 'nEw@GMail.COm', password: 'pw'
    user.save!
    assert_equal 'new@gmail.com', user.email
  end

  test 'name not blank' do
    user = User.new email: 'new@gmail.com', password: 'pw'
    refute user.valid?
  end

  test 'email not blank' do
    user = User.new name: 'new', email: '', password: 'pw'
    refute user.valid?
  end

  test 'default role is client' do
    user = User.new name: 'new', email: 'new@gmail.com', password: 'pw'
    user.save!

    assert_equal user.role, 'client'
  end

  test 'name too long' do 
    user = User.new name: 'new new new new new new new new new new new new new new new new new new new new new new new new new new new new new new new new new new new', email: '', password: 'pw'
    refute user.valid?
  end
  
end
