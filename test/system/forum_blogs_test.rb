require "application_system_test_case"

class ForumBlogsTest < ApplicationSystemTestCase
  test "publish forum post" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(forum_path)
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

  test "edit forum post" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'New post', body: 'Blah blah', user: user
    post.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(post_path(Post.all.first))
    assert page.has_content?('New post')
    assert page.has_content?('Edit')
    assert page.has_content?('Delete')
    click_on('Edit')

    assert_equal current_path, edit_post_path(Post.all.first)
    fill_in('Title', with: 'New post EDITED')
    fill_in('Body', with: 'Blah blah')
    click_on('Submit')

    assert_equal Post.all.first.title, 'New post EDITED'
    assert page.has_content?("New post EDITED")
  end

  test "delete forum post" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw'
    user.save!
    post = Post.new title: 'New post', body: 'Blah blah', user: user
    post.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(post_path(Post.all.first))
    assert page.has_content?('New post')
    click_on('Delete')

    assert_equal current_path, posts_path
    assert_equal Post.all.count, 0
  end

  test "publish blog" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(blogposts_path)
    assert page.has_content?('Write an article')
    click_on('Write an article')

    assert_equal current_path, new_blogpost_path
    fill_in('Title', with: 'New post')
    fill_in('Meta', with: 'something')
    fill_in('Body', with: 'Blah blah')
    click_on('Submit')

    assert_equal current_path, blogpost_path(Blogpost.all.first)
    assert_equal Blogpost.all.first.title, 'New post'
    assert_equal Blogpost.all.first.body, 'Blah blah'
    assert_equal Blogpost.all.first.meta, 'something'
    assert page.has_content?("New post")
    refute page.has_content?("something")
  end

  test "edit blog" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    post = Blogpost.new title: 'New post', meta: 'something', body: 'Blah blah', user: user
    post.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(blogpost_path(Blogpost.all.first))
    assert page.has_content?('Edit')
    assert page.has_content?('Delete')
    click_on('Edit')

    assert_equal current_path, edit_blogpost_path(Blogpost.all.first)
    fill_in('Title', with: 'New post EDITED')
    click_on('Submit')

    assert_equal Blogpost.all.first.title, 'New post EDITED'
    assert page.has_content?("New post EDITED")
  end

  test "delete blog" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    post = Blogpost.new title: 'New post', meta: 'something', body: 'Blah blah', user: user
    post.save!

    visit(new_session_path)
    fill_in('email', with: user.email)
    fill_in('password', with: user.password)
    click_on('Log in')

    visit(blogpost_path(Blogpost.all.first))
    assert page.has_content?('New post')
    click_on('Delete')

    assert_equal current_path, blogposts_path
    assert_equal Blogpost.all.count, 0
  end
end
