require 'rails_helper'

feature "user edits post in kit", %q(
    As a CCT or client
    I want to be delete posts in my kits
    so I clean up my kit at any time
) do

  # Acceptance Criteria

  # * I must be able to find a delete link to any post in my kit
  # * I must be directed back to my kit after deletion
  # * I must not find my post still in the kit after redirection
  # * As a client, I must be able to delete my own posts
  # * As a practitioner, I must be able to delete my own or my client's posts

  scenario "CCT deletes client's post" do

    post = FactoryGirl.create(:post, :to_practitioner)
    kit = post.kit

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    click_link "del-post-#{post.id}"

    expect(page).to_not have_content post.body
    expect(page).to have_content "Post deleted from kit."

  end

  scenario "CCT deletes own post" do

    post = FactoryGirl.create(:post, :to_client)
    kit = post.kit

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    click_link "del-post-#{post.id}"

    expect(page).to_not have_content post.body
    expect(page).to have_content "Post deleted from kit."

  end

  scenario "client deletes own post" do

    post = FactoryGirl.create(:post, :to_practitioner)
    kit = post.kit

    sign_in_as(kit.client)

    visit kit_path(kit)

    click_link "del-post-#{post.id}"

    expect(page).to_not have_content post.body
    expect(page).to have_content "Post deleted from kit."

  end

end
