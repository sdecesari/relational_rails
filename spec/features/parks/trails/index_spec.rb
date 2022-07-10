require 'rails_helper'

RSpec.describe 'parks trails index' do
   it "can see each trail that belongs to the park" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true) 

      visit "/parks/#{park.id}/trails"

      expect(page).to have_content(trail.name)
      
      save_and_open_page
   end 
end