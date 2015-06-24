require 'rails_helper'

RSpec.describe Word, type: :model do
  context "validations" do
   let!(:word) {FactoryGirl.build :word}
    
    it "should be valid" do 
      expect(word).to be_valid
    end

    it "requires content" do 
      word.content = nil 
      expect(word).not_to be_valid
    end

    it "requires associate category" do 
      word.category = nil
      expect(word).not_to be_valid
    end
  end
end
