FactoryGirl.define do
  factory :organization do |u|
    u.name { Faker::Company.name }
  end
end
