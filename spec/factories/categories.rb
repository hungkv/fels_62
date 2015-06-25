FactoryGirl.define do
  factory :category do
    title "Basic 500"
    
    factory :category_with_word do
      after :create do |category|
        100.times.each do
          create :word, category: category
        end
      end
    end
  end
end
