require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {FactoryGirl.build :user}

  it "should is valid" do
    expect(user).to be_valid
  end

  context "Email" do
    it "should valid when email empty" do
      user.email = nil
      expect(user).to_not be_valid
    end

    it "should not duplicate email" do 
      user.email = "giang.phan1106gmail.com"
      user.save
      other_user = FactoryGirl.build :user
      other_user.email = "giang.phan1106gmail.com"
      expect(other_user).to_not be_valid
    end

    it "should valid format email" do
      user.email = "giang.phan1106"
      expect(user).to_not be_valid
    end

    it "should upcase email when save" do
      user.email = "Giang.phan1106gmail.com"
      user.save
      expect(user.email).to eql "giang.phan1106gmail.com"
    end

    context "Password" do 
      it "should valid when email empty" do
        user.password = nil
        expect(user).to_not be_valid
      end
    end
  end
end
