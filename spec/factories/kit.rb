FactoryGirl.define do
  factory :kit do
    association :practitioner, organization_id: 1
    association :client, organization_id: 1
  end
end
