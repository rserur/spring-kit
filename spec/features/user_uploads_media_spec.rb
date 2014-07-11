require 'rails_helper'

feature "user signs up", %q{
  As a client or clinician, counselor, or therapist (CCT)
  I want to drop in media like images, videos, PDFs, text files, or word documents
  so I can always have these resources available in my kit
} do

  # Acceptance Criteria

  # * I must be allowed to attach images to posts.
  # * I must be allowed to attach documents to posts.

  scenario "practitioner uploads GIF" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    fill_in "Title", with: "Image"
    fill_in "Body", with: "This is an image."
    attach_file('post[media]', 'spec/fixtures/file.gif')

    click_on "Create Post"

    expect(page).to have_css("img")
    expect(page).to have_content "Post added to kit."
  end

  scenario "client uploads PDF" do

    kit = FactoryGirl.create(:kit)

    sign_in_as(kit.client)

    visit kit_path(kit)

    fill_in "Title", with: "PDF"
    fill_in "Body", with: "This is an PDF."
    attach_file('post[media]', 'spec/fixtures/file.pdf')

    click_on "Create Post"

    expect(page).to have_css("img")
    expect(page).to have_content "Post added to kit."

  end

end
