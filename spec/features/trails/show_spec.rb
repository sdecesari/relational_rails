require 'rails_helper'

RSpec.describe 'trails show page', type: :feature do
   it "can show the trail by id with its attributes" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 

      visit "/trails/#{trail.id}"
   
      expect(page).to have_content(trail.name)
      expect(page).to have_content(trail.difficulty)
      expect(page).to have_content(trail.open)

      save_and_open_page
   end 
end