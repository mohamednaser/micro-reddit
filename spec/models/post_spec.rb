require 'rails_helper'

RSpec.describe 'Test Post Model :', type: :model do
  before :each do
    User.create(name: 'mohamed', email: 'asd@asd.com').save
    @user_obj = User.first
    @post_obj = Post.new
  end

  describe 'is valid with valid attributes' do
    it 'Create A valid post ' do
      @post_obj.user_id = @user_obj.id

      @post_obj.title = 'First POdt'
      @post_obj.details = 'Post details you can add any details here'

      expect(@post_obj).to be_valid
    end

    it 'invalid minimum details length ' do
      @post_obj.user_id = @user_obj.id

      @post_obj.title = 'First POdt'
      @post_obj.details = 'Post details '

      expect(@post_obj).not_to be_valid
    end
  end
end
