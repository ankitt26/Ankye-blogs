require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Ankit', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

  before { subject.save }

  describe 'test validations' do
    it 'requires name to be present' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'requires post_counter to be an integer' do
      subject.posts_counter = 'hello'
      expect(subject).to_not be_valid
    end

    it 'requires post_counter to be greater than or equal to 0' do
      subject.posts_counter = -2
      expect(subject).to_not be_valid
    end
  end
end
