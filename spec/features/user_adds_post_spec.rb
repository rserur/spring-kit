require 'rails_helper'

feature "user adds post to kit", %q{
    As a CCT or client
    I want to be able to post to a kit
    so I can communicate with my CCT or client online
} do

  # Acceptance Criteria

  # * I can optionally fill in a title.
  # * I must fill in a body.
  # * I must be able to indicate if a post should be sent as a message.

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
    expect(page).to have_content "Post added to kit."
  end

  scenario "Client posts to client's kit" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.client)

    visit kit_path(kit)

    fill_in "Title", with: "Coping Strategies I like"
    fill_in "Body", with: "- Meditation, mindful breathing, watching TV..."

    click_on "Create Post"

    expect(page).to have_content "Coping Strategies"
    expect(page).to have_content "Meditation"
    expect(page).to have_content "Post added to kit."
  end

  scenario "Client creates post as message" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.client)

    visit kit_path(kit)

    fill_in "Title", with: "A question"
    fill_in "Body", with: "Do we have an appointment on Monday?"
    check "Post and Send as Message?"

    click_on "Create Post"

    expect(page).to have_content "A question"
    expect(page).to have_content "appointment"
    expect(page).to have_content "Post sent to practitioner as message and added to kit."
  end

  scenario "Practitioner creates post as message" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    fill_in "Title", with: "Just a reminder"
    fill_in "Body", with: "Please bring the worksheet if you can."
    check "Post and Send as Message?"

    click_on "Create Post"

    expect(page).to have_content "reminder"
    expect(page).to have_content "worksheet"
    expect(page).to have_content "Post sent to client as message and added to kit."
  end

  scenario "Post invalid message" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    click_on "Create Post"

    expect(page).to have_content "Post could not be added to kit."

  end

end
