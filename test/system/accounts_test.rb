require "application_system_test_case"

class AccountsTest < ApplicationSystemTestCase
  test "updating account info" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(account_path)
    fill_in('Name', with: 'BLAH BLAH')
    click_on('Update')
    assert_equal User.all.first.name, 'BLAH BLAH'
  end

  test "account dog info" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(account_path)
    assert page.has_content?('Add dog')
    click_on('Add dog')
    assert_equal current_path, new_account_dog_path

    fill_in('Name', with: 'Zuka')
    fill_in('Birthday', with: '30.07.2021')
    click_on('Submit')
    assert page.has_content?("Edit my dog's details")
    assert_equal User.all.first.dog.name, 'Zuka'
  end

  test "account edit dog info" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    dog = Dog.new name: 'Zuka', gender: 'Male', breed: 'Mixed', birthday: '21.01.2020' 
    user.dog = dog
    dog.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(account_path)
    assert page.has_content?('My dog')
    click_on('My dog')

    fill_in('Name', with: 'Zarko')
    click_on('Update')
    assert page.has_content?("Edit my dog's details")
    assert_equal User.all.first.dog.name, 'Zarko'
  end

  test "account forum" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(account_posts_path)
    assert page.has_content?('New forum post')
    click_on('New forum post')

    assert_equal current_path, new_post_path
    fill_in('Title', with: 'New post')
    fill_in('Body', with: 'Blah blah')
    click_on('Submit')

    assert_equal Post.all.first.title, 'New post'
    assert_equal Post.all.first.body, 'Blah blah'

    assert page.has_content?("New post")
  end
end
