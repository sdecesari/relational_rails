require 'rails_helper'

RSpec.describe 'index page view' do
   it "when i visit the index page i can see the name of the park" do 
   park = Park.create(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
   
   visit '/parks'

   expect(page).to have_content(park.name)
   save_and_open_page
   end 
end 