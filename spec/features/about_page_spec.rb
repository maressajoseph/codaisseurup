require "rails_helper"

describe "About Page" do
  it "shows information about the application" do
    visit root_url
    click_on "About"

    expect(page).to have_content "About CodaisseurUp"
  end
end
