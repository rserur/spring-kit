# require 'rails_helper'

# feature "user signs up", %q{
#   As a client or clinician, counselor, or therapist (CCT)
#   I want to drop in media like images, videos, PDFs, text files, or word documents
#   so I can always have these resources available in my kit
# } do

#   # Acceptance Criteria

#   # * I must post these by attaching them to a message.
#   # * I must be presented with an error if the file type is not acceptable.

#   scenario "user uploads image" do

#     kit = FactoryGirl.create(:kit)

#     sign_in_as(kit.practitioner_id)

#     visit kit_path(kit.client_id)

#     fill_in "Title", with: "Image"
#     fill_in "Body", with: "This is an image."

#     click_on "Sign up"

#     expect(page).to have_content "You have signed up successfully."
#   end

#   scenario "user signs up without required information" do
#     visit new_user_registration_path

#     click_on "Sign up"

#     expect(page).to have_content "can't be blank"
#   end
# end
