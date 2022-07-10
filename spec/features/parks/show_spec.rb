require 'rails_helper'

RSpec.describe 'park show page', type: :feature do
   it "can show the park by id with its attributes" do 
      park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)

      visit "/parks/#{park.id}"
   
      expect(page).to have_content(park.name)
      expect(page).to have_content(park.cost)
      expect(page).to have_content(park.daily_visitors)

      # save_and_open_page
   end 

end