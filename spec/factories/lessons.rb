FactoryGirl.define do
  factory :lesson do
    category
    user
    
    factory :lesson_with_lesson_word do 
      after :create do |lesson|
        create :lesson_word, lesson: lesson
      end      
    end
  end
end
