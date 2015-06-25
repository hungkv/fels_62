FactoryGirl.define do
  factory :user do
    pass =  Faker::Internet.password
    name Faker::Name.name
    email {Faker::Internet.safe_email}
    password pass
    password_confirmation pass
  end
end
