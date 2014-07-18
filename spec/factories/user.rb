# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.safe_email }
    password { 'password123'}
    notes { Faker::Lorem.paragraph }
    phone "9412685217"

    factory :practitioner do
      role 'practitioner'
    end

    factory :client do
      role 'client'
    end

    association :organization

  end
end
