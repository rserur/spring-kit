require 'rails_helper'

feature "user signs in", %q{
    As an organization's client or practitioner
    I want to login with an account generated for my email address
    so I can use an account provided by the organization
} do

  # Acceptance Criteria
  #
  # * I must be able to sign in as a client.
  # * I must be able to sign in as a practitioner.
  # * I must receive an email invitation.
  # * I must receive a temporary password to officially sign up with.
  # * I must change my password once registration is finished.

  scenario "client signs in with valid credentials" do
    practitioner = FactoryGirl.create(:user, :practitioner, id: 1)
    client = FactoryGirl.create(:user, :client)

    visit new_user_session_path

    fill_in "Email", with: client.email
    fill_in "Password", with: client.password
    click_on "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Kit #{client.id}"
  end

  scenario "practitioner signs in with valid credentials" do
    practitioner = FactoryGirl.create(:user, :practitioner)

    visit new_user_session_path

    fill_in "Email", with: practitioner.email
    fill_in "Password", with: practitioner.password
    click_on "Sign in"

    expect(page).to have_content "Signed in successfully."
    expect(page).to have_content "Kits"
  end

  scenario "user signs in with invalid credentials" do
    visit new_user_session_path
    click_on "Sign in"

    expect(page).to have_content "Invalid email or password."
  end

end
