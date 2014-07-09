# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |u|
    u.first_name { Faker::Name.first_name }
    u.last_name { Faker::Name.last_name }
    u.email { Faker::Internet.safe_email }
    u.password { 'password123'}
    u.notes { Faker::Lorem.paragraph }

    u.trait :practitioner do
      role { 'practitioner' }
    end

    u.trait :client do
      role { 'client' }
    end

    association :organization, factory: :organization
  end
end
