require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'responds with a successful status, correct template, and placeholder text' do
      get '/users'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
      expect(response.body).to include('Please add users first')
    end
  end

  describe 'GET /users/:id' do
    it 'responds with a successful status, correct template, and placeholder text' do
      User.create(id: 1, name: 'Test User') # Create a user with ID 1
      get '/users/1'

      expect(response).to have_http_status(200)
      expect(response).to render_template(:show)
      expect(response.body).to include('Test User')
    end
  end
end
