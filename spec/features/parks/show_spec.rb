require 'rails_helper'

RSpec.describe 'park show page', type: :feature do
   it "can show the park by id with its attributes" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)

      visit "/parks/#{park.id}"
   
      expect(page).to have_content(park.name)
      expect(page).to have_content(park.cost)
      expect(page).to have_content(park.daily_visitors)
   end 

   it "can take you back to parent trail index" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 
      trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true) 
      trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true) 
      
      visit "/parks/#{park.id}"
      click_link 'Trails'
      
      expect(page).to have_link("Trails", :href=>"/parks/#{park.id}/trails")
   # save_and_open_page
   end

end