require 'rails_helper'

RSpec.describe 'Test Comment Model :', type: :model do
  before :each do
    User.create(name: 'mohamed', email: 'asd@asd.com').save
    @user_obj = User.first
    Post.create(user_id: @user_obj.id, title: 'This is Post title',
                details: 'Post details you can add any details here').save
    @post_obj = Post.first
    @comment_obj = Comment.new
  end

  describe 'is valid with valid attributes' do
    it 'Create A valid Comment ' do
      @comment_obj.user_id = @user_obj.id
      @comment_obj.post_id = Post.first.id
      @comment_obj.comment = 'First Comment in post'

      expect(@post_obj).to be_valid
    end

    it 'Check Not Valid Post Id ' do
      @comment_obj.user_id = @user_obj.id
      @comment_obj.comment = 'First Comment in post'

      expect(@comment_obj).not_to be_valid
    end

    it 'Check Not Valid user Id ' do
      @comment_obj.post_id = Post.first.id
      @comment_obj.comment = 'First Comment in post'

      expect(@comment_obj).not_to be_valid
    end
  end
end
