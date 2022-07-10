require 'rails_helper'

RSpec.describe 'parks trails index' do
   it "can see each trail that belongs to the park" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true) 
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true) 

      visit "/parks/#{park.id}/trails"

      expect(page).to have_content(trail_1.name)
      expect(page).to have_content(trail_2.name)
      expect(page).to have_content(trail_3.name)      
   end 
   
   it "can see all attributes for trails" do 
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
   
end