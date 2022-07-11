require 'rails_helper'

RSpec.describe 'park show page', type: :feature do
   it "user story 2: can show the park by id with its attributes" do
     park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
     park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)

      visit "/parks/#{park_1.id}"

      expect(page).to have_content(park_1.name)
      expect(page).to have_content(park_1.cost)
      expect(page).to have_content(park_1.daily_visitors)
      # save_and_open_page
   end

   it "can take you back to parent trail index" do
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      visit "/parks/#{park.id}"

      expect(page).to have_link("Park Trails", :href=>"/parks/#{park.id}/trails")
      click_link 'Park Trails'
      expect(current_path).to eq("/parks/#{park.id}/trails")
   # save_and_open_page
   end

end
