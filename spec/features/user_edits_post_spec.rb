require 'rails_helper'

feature "user edits post in kit", %q(
    As a CCT or client
    I want to be able to edit posts in my kits
    so I can adjust and correct posts at any time
) do

  # Acceptance Criteria

  # * I must be able to find an edit link to any post in my kit
  # * I must be directed back to my kit after editing
  # * I must be able to see my edits once redirected to the kit page
  # * As a client, I must be able to edit my own posts
  # * As a practitioner, I must be able to edit my posts or my client's posts

  scenario "CCT edits client's post" do

    post = FactoryGirl.create(:post, :to_practitioner)
    kit = post.kit

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    click_link "post-#{post.id}"

    fill_in "Title", with: "An edited title."
    fill_in "Body", with: "An edited body."
    fill_in "Collections (separated by commas)", with: "edits"

    click_on "Update Post"

    expect(page).to have_content "An edited title."
    expect(page).to have_content "An edited body."
    expect(page).to have_content "edits"
    expect(page).to have_content "Post edited!"

  end

  scenario "CCT edits own post" do

    post = FactoryGirl.create(:post, :to_client)
    kit = post.kit

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    click_link "post-#{post.id}"

    fill_in "Title", with: "An edited title."
    fill_in "Body", with: "An edited body."
    fill_in "Collections (separated by commas)", with: "edits"

    click_on "Update Post"

    expect(page).to have_content "An edited title."
    expect(page).to have_content "An edited body."
    expect(page).to have_content "edits"
    expect(page).to have_content "Post edited!"

  end

  scenario "client edits own post" do

    post = FactoryGirl.create(:post, :to_practitioner)
    kit = post.kit

    sign_in_as(kit.client)

    visit kit_path(kit)

    click_link "post-#{post.id}"

    fill_in "Title", with: "An edited title."
    fill_in "Body", with: "An edited body."
    fill_in "Collections (separated by commas)", with: "edits"

    click_on "Update Post"

    expect(page).to have_content "An edited title."
    expect(page).to have_content "An edited body."
    expect(page).to have_content "edits"
    expect(page).to have_content "Post edited!"

  end

end
