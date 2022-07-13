require 'rails_helper'

RSpec.describe 'delete a park' do
  it "user story 19: has a link to delete a park" do
    Park.destroy_all
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
    trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: false)
    trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

    visit "/parks/#{park.id}"
    click_link "Delete #{park.name}"
    expect(current_path).to eq ('/parks')
    expect(page).to_not have_content("Yosemite National Park")
  end
end
