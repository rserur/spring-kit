require 'rails_helper'

feature "user signs out", %q{
  As a practitioner or client
  I want to sign out
  So that other people can't use my account
} do

  scenario "practitioner signs out" do
    practitioner = FactoryGirl.create(:practitioner)
    sign_in_as(practitioner)

    click_on "Sign Out"

    expect(page).to have_content "Signed out successfully."
  end

  scenario "client signs out" do
    # practitioner = FactoryGirl.create(:user, :practitioner, id: 1)
    # client = FactoryGirl.create(:user, :client)
    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.client)

    click_on "Sign Out"

    expect(page).to have_content "Signed out successfully."
  end
end
