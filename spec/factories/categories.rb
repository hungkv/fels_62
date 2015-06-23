FactoryGirl.define do
  factory :category do
    title "Basic 500"
  
    factory :category_with_lesson do 
      after :create do |category|
        create :lesson, category: category
      end
    end
    
    factory :category_with_word do
      after :create do |category|
        create :word, category: category
      end
    end
  end

end
