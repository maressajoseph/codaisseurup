require "rails_helper"

describe "Terms and conditions page" do
  it "shows the terms and conditions" do
    visit root_url
    click_on "Terms and conditions"

    expect(page).to have_content "Terms and conditions"
  end
end
