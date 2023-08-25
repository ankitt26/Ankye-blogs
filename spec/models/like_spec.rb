require 'rails_helper'

RSpec.describe Like, type: :model do
  subject = User.new(name: 'Ankit', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                     bio: 'Teacher from Mexico.')
  first_post = Post.new(author: subject, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                        likes_counter: 0)
  first_like = Like.new(post: first_post, author: subject)

  it 'like should be valid' do
    expect(first_like).to be_valid
  end
end
