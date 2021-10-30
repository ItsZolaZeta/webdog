require 'test_helper'

class DogTest < ActiveSupport::TestCase
  test 'dog cannot be empty' do
    dog = Dog.new
    refute dog.valid?
  end

  test 'name not blank' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new user: user, breed: 'Mixed', gender: 'Male'
    refute dog.valid?
  end

  test 'breed not blank' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new user: user, name: 'Zuka', gender: 'Male'
    refute dog.valid?
  end

  test 'gender not blank' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new user: user, name: 'Zuka', breed: 'Mixed'
    refute dog.valid?
  end

  test 'gender in list' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new user: user, name: 'Zuka', breed: 'Mixed', gender: 'Non-binary'
    refute dog.valid?
  end

  test 'breed in list' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new user: user, name: 'Zuka', breed: 'Else', gender: 'Male'
    refute dog.valid?
  end

  test 'valid dog' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new user: user, name: 'Zuka', breed: 'Mixed', gender: 'Male'
    dog.save!
    assert_equal(dog, Dog.all.first)
  end
end
