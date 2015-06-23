require 'rails_helper'

RSpec.describe Category, type: :model do
  context "validation" do 
    let!(:category) {FactoryGirl.build :category}
    it "should be valid" do 
      expect(category).to be_valid
    end

    it "requires title" do 
      category.title = nil
      expect(category).not_to be_valid
    end    
  end
end
