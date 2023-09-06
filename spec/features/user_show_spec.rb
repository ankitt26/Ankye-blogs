require 'rails_helper'
RSpec.describe 'User Show Page', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ankit', photo: 'https://example.com/photo.jpg', bio: 'I am a new Gen coder',
                        posts_counter: 0)
    @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 2', text: 'This is the second post.', comments_counter: 0, likes_counter: 0)
    @post3 = @user.posts.create(title: 'Post 3', text: 'This is the third post.', comments_counter: 0, likes_counter: 0)
    @user.posts.create(title: 'Post 4', text: 'This is the forth post.', comments_counter: 0, likes_counter: 0)
  end
  describe 'User index page' do
    before(:each) { visit user_path(id: @user.id) }
    it 'displays the photos and username of user' do
      expect(page.has_xpath?("//img[@src='https://example.com/photo.jpg']"))
      expect(page).to have_content('Ankit')
    end
    it "shows the number of posts of user, user bio, and the user's first 3 posts " do
      expect(page).to have_content('Number of posts: 4')
      expect(page).to have_content('I am a new Gen coder')
      expect(page).not_to have_content('This is the first post.')
    end
    it "Displays a button that lets me view all of a user's posts" do
      expect(page).to have_link('See All Posts', href: "/users/#{@user.id}/posts")
    end
    it 'redirects to open all posts of a user' do
      click_link('See All Posts')
      expect(page).to have_current_path(user_posts_path(@user))
    end
    it 'redirects to open a post of a user' do
      click_link('Post 3')
      expect(page).to have_current_path(user_post_path(user_id: @post3.author_id, id: @post3.id))
    end
  end
end
