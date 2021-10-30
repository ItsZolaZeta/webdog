require "application_system_test_case"

class AuthorizationsTest < ApplicationSystemTestCase
  test "edit blog only for admin and trainer" do
    user = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    user.save!
    post = Blogpost.new title: 'New post', meta: 'something', body: 'Blah blah', user: user
    post.save!

    client = User.new name: 'Oana', email: 'oana@gmail.com', password: 'pw'
    client.save!
    visit(new_session_path)
    fill_in('email', with: client.email)
    fill_in('password', with: client.password)
    click_on('Log in')

    visit(blogpost_path(Blogpost.all.first))
    assert page.has_content?('New post')
    refute page.has_content?('Edit')
    refute page.has_content?('Delete')

    admin = User.new name: 'Robin', email: 'robin@gmail.com', password: 'pw', role: 'admin'
    admin.save!
    visit(logout_path)
    visit(new_session_path)
    fill_in('email', with: admin.email)
    fill_in('password', with: admin.password)
    click_on('Log in')

    visit(blogpost_path(Blogpost.all.first))
    assert page.has_content?('New post')
    assert page.has_content?('Edit')
    assert page.has_content?('Delete')
  end

  test "edit forum only for owner or admin and trainer" do
    trainer = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    trainer.save!
    client = User.new name: 'Oana', email: 'oana@gmail.com', password: 'pw'
    client.save!
    client1 = User.new name: 'Daniel', email: 'daniel@gmail.com', password: 'pw'
    client1.save!
    admin = User.new name: 'Robin', email: 'robin@gmail.com', password: 'pw', role: 'admin'
    admin.save!

    post = Post.new title: 'New post', body: 'Blah blah', user: client
    post.save!

    visit(new_session_path)
    fill_in('email', with: client.email)
    fill_in('password', with: client.password)
    click_on('Log in')

    visit(post_path(Post.all.first))
    assert page.has_content?('New post')
    assert page.has_content?('Edit')
    assert page.has_content?('Delete')

    visit(logout_path)
    visit(new_session_path)
    fill_in('email', with: admin.email)
    fill_in('password', with: admin.password)
    click_on('Log in')

    visit(post_path(Post.all.first))
    assert page.has_content?('New post')
    assert page.has_content?('Edit')
    assert page.has_content?('Delete')

    visit(logout_path)
    visit(new_session_path)
    fill_in('email', with: trainer.email)
    fill_in('password', with: trainer.password)
    click_on('Log in')
    
    visit(post_path(Post.all.first))
    assert page.has_content?('New post')
    assert page.has_content?('Edit')
    assert page.has_content?('Delete')

    visit(logout_path)
    visit(new_session_path)
    fill_in('email', with: client1.email)
    fill_in('password', with: client1.password)
    click_on('Log in')
    
    visit(post_path(Post.all.first))
    assert page.has_content?('New post')
    refute page.has_content?('Edit')
    refute page.has_content?('Delete')
  end

  test "see users only trainer and admin" do
    trainer = User.new name: 'Tatiana', email: 'tatiana@gmail.com', password: 'pw', role: 'trainer'
    trainer.save!
    client = User.new name: 'Oana', email: 'oana@gmail.com', password: 'pw'
    client.save!
    admin = User.new name: 'Robin', email: 'robin@gmail.com', password: 'pw', role: 'admin'
    admin.save!

    visit(new_session_path)
    fill_in('email', with: client.email)
    fill_in('password', with: client.password)
    click_on('Log in')

    visit(root_path)
    refute page.has_content?('All Users')
    visit(users_path)
    refute page.has_content?('Robin')

    visit(logout_path)
    visit(new_session_path)
    fill_in('email', with: trainer.email)
    fill_in('password', with: trainer.password)
    click_on('Log in')
    visit(root_path)
    assert page.has_content?('All Users')
    click_on('All Users')
    assert page.has_content?('Tatiana')
    assert page.has_content?('Oana')
    assert page.has_content?('Robin')

    visit(logout_path)
    visit(new_session_path)
    fill_in('email', with: admin.email)
    fill_in('password', with: admin.password)
    click_on('Log in')
    visit(root_path)
    assert page.has_content?('All Users')
    click_on('All Users')
    assert page.has_content?('Tatiana')
    assert page.has_content?('Oana')
    assert page.has_content?('Robin')
  end

end
