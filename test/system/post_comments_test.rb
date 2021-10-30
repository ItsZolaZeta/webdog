require "application_system_test_case"

class PostCommentsTest < ApplicationSystemTestCase
  test 'adding a comment to an post' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'Hello', body: 'body text', user: user
    post.save!

    visit(login_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(post_path(post))
    find(id: 'comment_body', match: :first).fill_in(with: 'Comment body text')
    click_on('Submit', match: :first)
    assert_equal post_path(post), page.current_path
    assert page.has_content?('Comment body text')
  end

  test 'comments cannot be added when not logged in' do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'Hello', body: 'body text', user: user
    post.save!

    visit(post_path(post))
    refute page.has_content?('Add a comment')
  end
end
