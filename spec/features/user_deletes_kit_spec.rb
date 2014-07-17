require 'rails_helper'

feature "user edits post in kit", %q(
    As a CCT
    I want to be delete kits
    so I delete kits no longer needed or in use
) do

  # Acceptance Criteria

  # * As a practitioner, I must be able to see a kit delete link on kits page
  # * I must be directed back to my index after deletion
  # * I must not find the kit still listed on the kit page afterwards
  # * As a client, I must be able to delete my own posts

  scenario "CCT deletes kit" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kits_path

    click_link "del-#{kit.id}"

    expect(page).to_not have_content kit.client.first_name
    expect(page).to have_content "Kit deleted."
  end
end
