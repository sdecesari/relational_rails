require 'rails_helper'

RSpec.describe 'index page view', type: :feature do
   it "when i visit the index page i can see the name of the park" do 
      Park.destroy_all
      park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)
      
      visit '/parks'

      expect(page).to have_content(park_1.name)
      expect(page).to have_content(park_2.name)
   end 
   
   it "can show park created most recently" do 
      Park.destroy_all
      park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)
      
      visit "/parks"
      
      expect(page).to have_content(park_1.created_at)
      expect(page).to have_content(park_2.created_at)
   end 
   
   it "can take you back to park index" do 
      Park.destroy_all
      park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)
      
      visit '/parks'
      click_link "Parks"
      
      expect(page).to have_link("Parks", :href=>"/parks")
   end

   it "can take you back to trail index" do 
      Park.destroy_all
      park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)
      
      visit '/parks'
      click_link "Trails"
      
      expect(page).to have_link("Trails", :href=>"/trails")
      # save_and_open_page
   end
end 
