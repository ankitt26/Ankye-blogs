require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'Test User', photo: 'https://example.com/photo.jpg', bio: 'A test user') }

  describe 'GET /posts' do
    it 'responds with a successful status, correct template, and placeholder text' do
      get "/users/#{user.id}/posts" # Use the ID of an existing user

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('<div class="container bg-dark-subtle posts-page">')
expect(response.body).to include('<a href="/users/')
expect(response.body).to include('<button id="back-btn">🔙</button>')
expect(response.body).to include('class="pagination justify-content-center align-items-center"')

    end
  end

  describe 'GET /posts/:id' do
    it 'responds with a successful status, correct template, and placeholder text' do
      post = user.posts.create(title: 'Test Post', text: 'This is a test post') # Create a test post
      get "/users/#{user.id}/posts/#{post.id}" # Use the user and post IDs
  
      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('<h4 class="card-title">Test Post</h4>')
      expect(response.body).to include('<p class="text-truncate text-justify">This is a test post</p>')
    end
  end
  
end
