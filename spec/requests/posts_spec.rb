require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'responds with a successful status, correct template, and placeholder text' do
      get '/users/user_id/posts'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('Here is list of posts for a given user')
    end
  end

  describe 'GET /posts/:id' do
    it 'responds with a successful status, correct template, and placeholder text' do
      get '/users/user_id/posts/:id'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('Here is a detailed post for a given user')
    end
  end
end
