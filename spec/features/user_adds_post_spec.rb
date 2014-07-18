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
    fill_in "Collections (separated by commas)", with: "books, cognition"

    click_on "Create Post"

    expect(page).to have_content "Book Suggestions"
    expect(page).to have_content "Malcom Gladwell"
    expect(page).to have_content "Post added to kit."
    expect(page).to have_content "books"
    expect(page).to have_content "cognition"
  end

  scenario "Client posts to client's kit" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.client)

    visit kit_path(kit)

    fill_in "Title", with: "Coping Strategies I like"
    fill_in "Body", with: "- Meditation, mindful breathing, watching TV..."
    fill_in "Collections (separated by commas)", with: "strategies, notes"

    click_on "Create Post"

    expect(page).to have_content "Coping Strategies"
    expect(page).to have_content "Meditation"
    expect(page).to have_content "Post added to kit."
    expect(page).to have_content "strategies"
    expect(page).to have_content "notes"
  end

  scenario "Client creates post and sends as text message" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.client)

    visit kit_path(kit)

    fill_in "Title", with: "A question"
    fill_in "Body", with: "Do we have an appointment on Monday?"
    check "Post and send body as text message?"

    click_on "Create Post"

    expect(page).to have_content "A question"
    expect(page).to have_content "appointment"
    expect(page).to have_content "Post sent to practitioner as text message"
  end

  scenario "Practitioner creates post as text message" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    fill_in "Title", with: "Just a reminder"
    fill_in "Body", with: "Please bring the worksheet if you can."
    check "Post and send body as text message?"

    click_on "Create Post"

    expect(page).to have_content "reminder"
    expect(page).to have_content "worksheet"
    expect(page).to have_content "Post sent to client as text message"
  end

  scenario "Sender fails to send text message if no phone number" do

    client = FactoryGirl.create(:client, organization_id: 1, phone: "")

    kit = FactoryGirl.create(:kit, client_id: client.id)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    fill_in "Title", with: "Just a reminder"
    fill_in "Body", with: "Please bring the worksheet if you can."
    check "Post and send body as text message?"

    click_on "Create Post"

    expect(page).to have_content "reminder"
    expect(page).to have_content "worksheet"
    expect(page).to have_content "Post NOT sent as message. Recipient account has no phone number."
  end

  scenario "Post invalid message" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    click_on "Create Post"

    expect(page).to have_content "Post could not be added to kit."

  end

  scenario "User can see collections in kit" do

    post = FactoryGirl.create(:post, :to_client, :collected)

    sign_in_as(post.sender)

    visit kit_path(post.kit)

    expect(page).to have_content "my collection"
  end

end
