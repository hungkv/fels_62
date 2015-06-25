require 'rails_helper'

RSpec.describe Answer, type: :model do
  let!(:answer) {FactoryGirl.build :answer}
  it "should be valid" do 
    expect(answer).to be_valid
  end

  it "requires word" do
    answer.word = nil
    expect(answer).to_not be_valid
  end
end
