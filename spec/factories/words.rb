FactoryGirl.define do
  factory :word do
    category
    content Faker::Lorem.words
  end

end
