require "rails_helper"

describe "Creating a new event" do
  before { login_as user }

  let!(:user) { create :user }

  it "goes to the page to create a new event" do
    visit new_event_url

    expect(page).to have_content "Add a new event"
  end
end
