FactoryGirl.define do
  factory :kit do
    association :practitioner
    association :client
  end
end
