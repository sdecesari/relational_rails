require 'rails_helper'

RSpec.describe 'delete a trail' do
  it "user story 20: has a link to delete a trail" do
    Park.destroy_all
    Trail.destroy_all
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)

    visit "/trails/#{trail.id}"
    click_link "Delete #{trail.name}"
    expect(current_path).to eq ('/trails')
    expect(page).to_not have_content("Cook's Meadow Trail")
  end
end
