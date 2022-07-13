require 'rails_helper'

RSpec.describe Trail, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :difficulty}
    it { should allow_value(true).for (:open) }
    it { should allow_value(false).for :open }
  end

  describe "relationships" do
    it { should belong_to :park}
  end

  describe "true records" do
    it "user story: 15only shows open trails" do
      Park.destroy_all
      park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: false)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      expect(Trail.where(open: true)).to eq([trail_1, trail_3])
    end
  end

  xdescribe "alphabetical order" do
    it "user story 16: sorts trails alphabetically" do
      park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: false)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      trail = Trail.alphabetical_order

      expect(trail.alphabetical_order).to eq([trail_1, trail_3, trail_2])
    end
  end
end
