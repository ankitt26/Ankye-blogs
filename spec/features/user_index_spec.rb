require 'rails_helper'
RSpec.describe 'User Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ankit', photo: 'https://example.com/photo.jpg', bio: 'I am a new Gen coder',
                        posts_counter: 0)
    @user1 = User.create(name: 'Yash', photo: 'https://example.com/photo.jpg', bio: 'He is good programmer',
                         posts_counter: 0)
    @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
  end
  describe 'User index page' do
    before(:each) { visit users_path }
    it 'displays  a container and the username of each user' do
      expect(page).to have_css('div.container')
      expect(page).to have_content('Ankit')
      expect(page).to have_content('Yash')
    end
    it 'displays the photos of each user' do
      expect(page.has_xpath?("//img[@src='https://example.com/photo.jpg']"))
    end
    it 'shows the number of posts of each user' do
      expect(page).to have_content('Number of posts: 3')
      expect(page).to have_content('Number of posts: 0')
    end
    it "is redirected to that user's show page" do
      click_link('Ankit')
      visit user_path(@user)
      expect(page).to have_current_path(user_path(@user))
    end
  end
end
