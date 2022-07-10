require 'rails_helper'

RSpec.describe 'index page view', type: :feature do
   it "when i visit the index page i can see the name of the park" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      
      visit '/parks'

      expect(page).to have_content(park.name)
   save_and_open_page
   end 

   it "can show park created most recently" do 
      park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)

      visit "/parks"

      expect(page).to have_content(park_1.created_at)
      expect(page).to have_content(park_2.created_at)
   end 
end 
