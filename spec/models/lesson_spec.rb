require 'rails_helper'

RSpec.describe Lesson, type: :model do
  context "validations" do 
    let!(:lesson) {FactoryGirl.build :lesson}

    it "should be valid" do 
      expect(lesson).to be_valid
    end

    it "requires category" do 
      lesson.category = nil
      expect(lesson).not_to be_valid
    end
    it "requires user" do 
      lesson.user = nil
      expect(lesson).not_to be_valid
    end
  end
end
