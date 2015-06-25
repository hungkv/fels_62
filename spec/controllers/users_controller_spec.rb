require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  include Devise::TestHelpers

  before :each do
    @user = FactoryGirl.build :user
    sign_in :user, @user
  end

  describe "Patch #update" do   
    it "should redirect to sign in page if user not signed in" do 
      sign_out :user
      @user.save
      patch :update, id: @user.id
      expect(response).to redirect_to new_user_session_path
    end

    it "Updated and redirect to homepage" do
      user_name = Faker::Internet.user_name
      @user.name = user_name
      @user.save
      patch(:update, {id: @user.id})
      expect(@user.name).to eq(user_name)
    end
  end
end
