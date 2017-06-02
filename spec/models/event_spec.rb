require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "validations" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:starts_at) }
    it { is_expected.to validate_presence_of(:ends_at) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_length_of(:description).is_at_most(500) }
    it { is_expected.to validate_presence_of(:location) }
    it { is_expected.to validate_presence_of(:price) }
  end

  describe "#bargain?" do
  let(:bargain_event) { create :event, price: 20 }
  let(:non_bargain_event) { create :event, price: 200 }

    it "returns true if the price is smaller than 30 EUR" do
      expect(bargain_event.bargain?).to eq(true)
      expect(non_bargain_event.bargain?).to eq(false)
    end
  end

  describe ".order_by_price" do
  let!(:event1) { create :event, price: 100 }
  let!(:event2) { create :event, price: 200 }
  let!(:event3) { create :event, price: 300 }

    it "returns a sorted array of events by prices" do
      expect(Event.order_by_price).to match_array [event1, event2, event3]
    end
  end

  describe "association with user" do
  let(:user) { create :user }

    it "belongs to a user" do
      event = user.events.new

      expect(event.user).to eq(user)
    end
  end

  describe "association with theme" do
    let(:event) { create :event }

    let(:theme1) { create :theme, name: "Sweet16", events: [event] }
    let(:theme2) { create :theme, name: "80's", events: [event] }
    let(:theme3) { create :theme, name: "Chill", events: [event] }

    it "has themes" do
      expect(event.themes).to include(theme1)
      expect(event.themes).to include(theme2)
      expect(event.themes).to include(theme3)
    end
  end

  describe "association with registration" do
    let(:guest_user) { create :user, email: "guest@user.com" }
    let(:host_user) { create :user, email: "host@user.com" }

    let!(:event) { create :event, user: host_user }
    let!(:registration) { create :registration, event: event, user: guest_user }

    it "has guests" do
      expect(event.guests).to include(guest_user)
    end
  end

  describe ".order_by_name" do
  let!(:event1) { create :event, name: "a" }
  let!(:event2) { create :event, name: "b" }
  let!(:event3) { create :event, name: "c" }

    it "returns a sorted array of events by names" do
      expect(Event.order_by_name).to match_array [event1, event2, event3]
    end
  end

  describe ".starts_on" do
  let!(:event1) { create :event, starts_at: "2017-06-01 10:10:05" }

    it "returns events that start on given date" do
      expect(Event.starts_on("2017-06-01 10:10:05")).to match_array [event1]
    end
  end

end
