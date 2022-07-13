require 'rails_helper'

RSpec.describe Park, type: :model do
   describe "validations" do
      it { should validate_presence_of :name }
      it { should validate_presence_of :daily_visitors }
      it { should allow_value(true).for (:cost) }
      it { should allow_value(false).for (:cost) }
   end

   describe "relationships" do
      it { should have_many :trails}
   end

   it "user story 6: can show park created most recently and put in ascending order" do
     Park.destroy_all
      park_1 = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)

      expect(Park.ordered).to eq([park_1, park_2])
   end

   it "user story 7: can count how many trails each park has" do
     Park.destroy_all
     park_1 = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
     trail_1 = park_1.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
     trail_2 = park_1.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
     trail_3 = park_1.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

     expect(park_1.trails.all.count).to eq(3)
   end
end
