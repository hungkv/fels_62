require 'rails_helper'

RSpec.describe LessonWord, type: :model do
  let!(:lesson_word) {FactoryGirl.build :lesson_word}
  context "Validation" do
    it "should be valid" do 
      expect(lesson_word).to be_valid
    end

    it "requires word" do
      lesson_word.answer = nil
      expect(lesson_word).to_not be_valid
    end

    it "requires lesson" do
      lesson_word.lesson = nil
      expect(lesson_word).to_not be_valid
    end

    it "requires answer" do
      lesson_word.answer = nil
      expect(lesson_word).to_not be_valid
    end
  end
end
