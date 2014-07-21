require 'rails_helper'

feature "user searches for post in kit", %q(
    As a CCT or client
    I want to be search for a post
    so I can quickly find one
) do

  scenario "CCT searches for post" do

    post1 = FactoryGirl.create(:post, :to_practitioner)
    kit = post1.kit
    post2 = FactoryGirl.create(:post, :to_practitioner, kit_id: kit.id)

    sign_in_as(kit.practitioner)

    visit kit_path(kit)

    fill_in "search_terms", with: post1.title

    click_on "Go"

    expect(page).to have_content post1.title
    expect(page).to_not have_content post2.title
  end
end
