FactoryGirl.define do
  factory :category do
    title {Faker::Name.title}
    
    factory :category_with_word do
      after :create do |category|
        100.times.each do
          create :word, category: category, content: Faker::Name.title
        end
      end
    end
  end
end
