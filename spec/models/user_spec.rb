require 'rails_helper'

RSpec.describe 'Test User Model ', type: :model do
  before :each do
    @user_obj = User.new
  end

  describe 'is valid with valid attributes' do
    it 'Create A valid user ' do
      @user_obj.name = 'Mohamed Ahmed'
      @user_obj.email = 'Mohamed Ahmed'

      expect(@user_obj).to be_valid
    end

    it 'invalid minimum name length ' do
      @user_obj.name = 'as'
      expect(@user_obj).not_to be_valid
    end

    it 'invalid maximum name length ' do
      @user_obj.name = 'asasd' * 50
      expect(@user_obj).not_to be_valid
    end

    it 'Check Save User' do
      @user_obj.name = 'Mohamed Naser'
      @user_obj.email = 'asd@asd.com'
      @user_obj.save

      expect(@user_obj).to eql(User.first)
    end
  end

  describe 'With Comments ' do
    it 'Valid Comment' do
      @user_obj.name = 'mohamed'
      @user_obj.email = 'asd@asd.com'
      @user_obj.save

      Post.create(user_id: @user_obj.id, title: 'temp title', details: 'Post details you can add any details here').save
      Comment.create(user_id: @user_obj.id, post_id: 1, comment: 'this is a comment').save

      expect(Comment.first.comment).to eql('this is a comment')
    end
  end
end
