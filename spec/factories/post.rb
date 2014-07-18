FactoryGirl.define do
  factory :post do
    title { Faker::Lorem.sentence.capitalize }
    body { Faker::Lorem.paragraph }

    association :kit

    trait :to_practitioner do
      sender_id { kit.client_id }
      recipient_id { kit.practitioner_id }
    end

    trait :to_client do
      sender_id { kit.practitioner_id }
      recipient_id { kit.client_id }
    end

    trait :collected do
      after(:create) { |post| post.update_attributes(collection_list:
      'my collection') }
    end
  end
end
