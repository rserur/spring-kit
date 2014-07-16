require 'rails_helper'

feature "user adds post to kit", %q(
    As a CCT
    I want to create a protected sharing space for each of my registered clients
    so each client has their own space
) do

  # Acceptance Criteria

  # * I can create a kit for any client registered with my organization
  # * I cannot create a kit for any client registered outside of my organization

  scenario "CCT creates a kit for current client" do

    cct = FactoryGirl.create(:practitioner)
    client = FactoryGirl.create(:client, organization_id: cct.organization_id)

    sign_in_as(cct)

    visit new_kit_path
    select client.first_name, from: 'kit[client_id]'

    click_on "Create Kit"

    expect(page).to have_content "Kit successfully created."
    expect(page).to have_content "Owner: #{client.first_name}"

  end

  scenario "CCT can't see a client outside of the organization" do

    practitioner = FactoryGirl.create(:practitioner)
    client = FactoryGirl.create(:client)

    sign_in_as(practitioner)

    visit new_kit_path

    page.has_select?('kit[client_id', options: [])

  end

end
