require 'rails_helper'

RSpec.feature 'Post Index', type: :feature do
  before(:each) do
    @user = User.create(name: 'Ankit', photo: 'https://blog.short.io/content/images/2018/01/short.cm-logo-1024x1024.png', bio: 'I am a new Gen coder',
        posts_counter: 0)
    @post1 = @user.posts.create(title: 'Post 1', text: 'This is the first post.', comments_counter: 0, likes_counter: 0)
    Comment.create(post: @post1, author: @user, text: 'This is a comment')
    Like.create(post: @post1, author: @user)
  end

  describe 'User index page' do
    before(:each) { visit user_post_path(@user, @post1) }

    it "I can see the post's title." do
      expect(page).to have_content('Post 1')
    end

    it 'I can see who wrote the post' do
      expect(page).to have_content('Post by Ankit')
    end

    it 'I can see how many comments and likes it has.' do
      expect(page).to have_content('Comments: 1,')
      expect(page).to have_content('Likes: 1')
    end

    it 'I can see the post body' do
      expect(page).to have_content('This is the first post.')
    end

    it 'I can see the username of each commentor and the comment each commentor left.' do
      expect(page).to have_content('Ankit: This is a comment')
    end
  end
end