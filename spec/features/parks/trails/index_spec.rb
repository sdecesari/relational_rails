require 'rails_helper'

RSpec.describe 'parks trails index' do
   it "user story 5: can see each trail that belongs to the park" do
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      visit "/parks/#{park.id}/trails"

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_3.name)
   end

   it "user story 5: can see all attributes for trails" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      visit "/parks/#{park.id}/trails"

      expect(page).to have_content(trail_1.difficulty)
      expect(page).to have_content(trail_1.open)
      expect(page).to have_content(trail_2.difficulty)
      expect(page).to have_content(trail_2.open)
      expect(page).to have_content(trail_3.difficulty)
      expect(page).to have_content(trail_3.open)
   end

   it "can take you back to trail index" do
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      visit "/parks/#{park.id}/trails"
      click_link 'Trails'

      expect(page).to have_link("Trails", :href=>"/trails")
   # save_and_open_page
   end

   it "can take you back to park index" do
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

      visit "/parks/#{park.id}/trails"
      click_link 'Parks'

      expect(page).to have_link("Parks", :href=>"/parks")
   # save_and_open_page
   end

end
