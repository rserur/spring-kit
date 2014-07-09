require 'rails_helper'

describe Kit do
  before :each do
    FactoryGirl.create(:kit)
  end

  it { should belong_to(:client).class_name('User') }
  it { should belong_to(:practitioner).class_name('User') }

  it {should_not have_valid(:client_id).when(nil)}
  it {should_not have_valid(:practitioner_id).when(nil)}

  it { should validate_uniqueness_of(:client_id).scoped_to(:practitioner_id) }
end
