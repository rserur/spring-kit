require 'rails_helper'

RSpec.describe User, :type => :model do
  describe User do
    it { should have_many(:posts).dependent(:destroy)}

    describe "#password" do
      it { should have_valid(:password).when("abcd1234", "asd^2jk@%#&!!") }
      it { should_not have_valid(:password).when("abc123", nil, "") }
    end

    describe "#password_confirmation" do
      subject { FactoryGirl.build(:user, password: "abcd1234") }
      it { should have_valid(:password_confirmation).when("abcd1234") }
      it { should_not have_valid(:password_confirmation).when("asdfg") }
    end

    describe "#practitioner_email" do
      subject { FactoryGirl.create(:user, :practitioner) }
      it { should have_valid(:email).when("example@example.com", "me@sample.com") }
      it { should_not have_valid(:email).when("asf", "example.com", "me@", nil, "") }
      it { should validate_uniqueness_of(:email) }
    end

    describe "#client_email" do
      subject { FactoryGirl.create(:user, :client) }
      it { should have_valid(:email).when("example@example.com", "me@sample.com") }
      it { should_not have_valid(:email).when("asf", "example.com", "me@", nil, "") }
      it { should validate_uniqueness_of(:email) }
    end
  end
end
