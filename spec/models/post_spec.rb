require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:user) do
    User.create(
      name: 'Ankit',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.'
    )
  end

  subject do
    described_class.new(
      author: user,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  describe 'test present validations' do
    it 'requires title to be present' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'requires comments_counter to be present' do
      subject.comments_counter = nil
      expect(subject).to_not be_valid
    end

    it 'requires likes_counter to be present' do
      subject.likes_counter = nil
      expect(subject).to_not be_valid
    end

    it 'Maximum title length should be 250' do
      subject.title = 'a' * 251
      expect(subject).to_not be_valid
    end
  end

  describe 'test comments_counter validations' do
    it 'requires comments_counter to be an integer' do
      subject.comments_counter = 'comment'
      expect(subject).to_not be_valid
    end

    it 'requires comments_counter to be greater than or equal to 0' do
      subject.comments_counter = -2
      expect(subject).to_not be_valid
    end
  end

  describe 'test likes_counter validations' do
    it 'requires likes_counter to be an integer' do
      subject.likes_counter = 'like'
      expect(subject).to_not be_valid
    end

    it 'requires likes_counter to be greater than or equal to 0' do
      subject.likes_counter = -3
      expect(subject).to_not be_valid
    end
  end
end
