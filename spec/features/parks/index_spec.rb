require 'rails_helper'

RSpec.describe 'index page view', type: :feature do
   it "user story 1: when i visit the park index page i can see the name of the park" do
      Park.destroy_all
      park_1 = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
      park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)

      visit '/parks'

      expect(page).to have_content(park_1.name)
      expect(page).to have_content(park_1.cost)
      expect(page).to have_content(park_1.daily_visitors)
      expect(page).to have_content(park_2.name)
      expect(page).to have_content(park_2.cost)
      expect(page).to have_content(park_2.daily_visitors)
   end

   it "user story 9: scan take you back to park index" do
      visit '/parks'
      click_link "Parks"

      expect(page).to have_link("Parks", :href=>"/parks")
      # save_and_open_page
   end

   it "user story 8: can take you back to trail index" do
      visit '/parks'
      click_link "Trails"

      expect(page).to have_link("Trails", :href=>"/trails")
      # save_and_open_page
   end
end
