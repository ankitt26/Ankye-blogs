require 'rails_helper'

RSpec.describe 'Post Index', type: :feature do
  before(:each) do
    @user = User.create(
      name: 'Ankit',
      photo: 'https://blog.short.io/content/images/2018/01/short.cm-logo-1024x1024.png',
      bio: 'I am a new Gen coder',
      posts_counter: 0
    )
    @post1 = @user.posts.create(
      title: 'Post 1',
      text: 'This is the first post.',
      comments_counter: 0,
      likes_counter: 0
    )
    @post2 = @user.posts.create(
      title: 'Post 2',
      text: 'This is the second post.',
      comments_counter: 0,
      likes_counter: 0
    )
    Comment.create(post: @post1, author: @user, text: 'This is a comment')
    Like.create(post: @post1, author: @user)
    visit user_posts_path(@user)
  end

  describe 'User index page' do
    before(:each) { visit user_posts_path(@user) }

    it 'displays user information' do
      expect(page).to have_xpath("//img[@src='https://blog.short.io/content/images/2018/01/short.cm-logo-1024x1024.png']")
      expect(page).to have_content('Ankit')
      expect(page).to have_content('Number of posts: 2')
    end

    it 'displays post information' do
      expect(page).to have_content('Post 1')
      expect(page).to have_content('This is the first post.')
      expect(page).to have_content('Post 2')
      expect(page).to have_content('This is the second post.')
    end

    it 'displays comments and likes' do
      expect(page).to have_content('This is a comment')
      expect(page).to have_content('Comments: 1,')
      expect(page).to have_content('Likes: 1')
      expect(page).to have_content('1')
    end

    it 'redirects to post show page when clicking on a post' do
      click_link 'Post 1'
      expect(page).to have_current_path(user_post_path(@user, @post1))
    end
  end
end
