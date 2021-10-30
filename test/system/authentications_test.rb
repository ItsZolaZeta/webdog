require "application_system_test_case"

class AuthenticationsTest < ApplicationSystemTestCase
  test "sign up" do
    visit signup_path
    fill_in 'Email', with: 'tatiana@gmail.com'
    fill_in 'Name', with: 'Tatiana'
    fill_in 'Password', with: 'pw'
    click_on 'Signup', match: :first

    assert_equal 1, User.all.length
    assert_equal 'tatiana@gmail.com', User.first.email
  end

  test 'log in' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    assert page.has_content?('Hello, Tatiana')
  end

  test 'log in does not create a new User' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    assert_equal 1, User.all.length
  end
end
