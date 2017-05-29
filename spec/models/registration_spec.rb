require 'rails_helper'

RSpec.describe Registration, type: :model do
  describe "set total price of registration" do
    let(:user) { create :user }
    let(:event) { create :event, price: 10 }
    let(:registration) { create :registration, guests_count: 2, event: event, user: user }

    it "has total price" do
      expect(registration.total).to match(20)
    end

  #  it "changes status of registration" do
  #    expect(registration.status).to have_content("Booked")
  #  end
  end
end
