FactoryGirl.define do
  factory :kit do
    association :practitioner, factory: [:user, :practitioner]
    association :client, factory: [:user, :client]
  end
end
