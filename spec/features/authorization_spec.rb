require 'rails_helper'

feature "user must be authorized to access kit actions", %q(
    As a CCT
    I want kit managment to be limited to practitioners
    so clients can only see their content
) do

  # Acceptance Criteria

  # * A signed-in client cannot access kit creation
  # * A signed-in client cannot access full list of kits
  # * A signed-in client cannot delete any kits

  scenario "client fails to access new kit page" do

    client = FactoryGirl.create(:client)

    sign_in_as(client)

  expect { visit new_kit_path }.to raise_error(ActionController::RoutingError)
  end
end
