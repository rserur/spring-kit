require 'rails_helper'

feature "user adds post to kit", %q{
    As a CCT or client
    I want to be able to post to a kit
    so I can communicate with my CCT or client online
} do

  # Acceptance Criteria

  # * I can optionally fill in a title.
  # * I must fill in a body.

  scenario "CCT posts to client's kit" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    fill_in "Title", with: "Book Suggestions"
    fill_in "Body", with: "The books I mentioned: How to Stop Worrying by Dale Carnegie
    and Blink the Power of Thinking by Malcom Gladwell"

    click_on "Create Post"

    expect(page).to have_content "Book Suggestions"
    expect(page).to have_content "Malcom Gladwell"
  end

end
