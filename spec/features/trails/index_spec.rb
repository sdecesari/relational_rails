require 'rails_helper'

RSpec.describe 'index page view' do
   it "when i visit index page i can see the name of the trail" do
   park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
   trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 

   visit '/trails'

   expect(page).to have_content(trail.name)
end 

   it "can take you back to trail index" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 
      
      visit '/trails'
      click_link 'Trails'
      
      expect(page).to have_link("Trails", :href=>"/trails")
   end 

   it "can take you back to park index" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 

      visit '/trails'
      click_link 'Parks'
      
      expect(page).to have_link("Parks", :href=>"/parks")
   # save_and_open_page
   end
end 