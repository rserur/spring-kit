require 'rails_helper'

feature "user signs up", %q{
  As a clinician, counselor, or therapist (CCT)
  I want to sign up for the service through my organization
  so my account is affiliated with my organization
} do

  # Acceptance Criteria

  # - I must select an organization in a dropdown list.
  # - I must enter a valid first name, last name, email address, and password.

  scenario "user signs up with valid information" do

    organization = FactoryGirl.create(:organization)

    visit new_user_registration_path

    fill_in "Email", with: "example@example.com"
    fill_in "First name", with: "Sally"
    fill_in "Last name", with: "O'Maley"
    select organization.name, from: 'user[organization_id]'
    fill_in "Password", with: "abcd1234", match: :prefer_exact
    fill_in "Password confirmation", with: "abcd1234"
    select "practitioner", from: 'user[role]'
    click_on "Sign up"
    save_and_open_page
    expect(page).to have_content "You have signed up successfully."
  end

  scenario "user signs up without required information" do
    visit new_user_registration_path

    click_on "Sign up"

    expect(page).to have_content "can't be blank"
  end
end
