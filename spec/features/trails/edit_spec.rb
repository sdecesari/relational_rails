require 'rails_helper'

RSpec.describe 'edit trails', type: :feature do
  it "user story 14: links to the edit page" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)

    visit "/trails/#{trail.id}"
    click_link "Update #{trail.name}"

    expect(current_path).to eq("/trails/#{trail.id}/edit")
  end

  it "user story 14: can edit the trail attributes" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)

    visit "/trails/#{trail.id}/edit"
    
    fill_in('name', with: "Cook's Meadow Trail")
    fill_in('difficulty', with: 1)
    fill_in('open', with: true)
    click_button 'Update Trail'

    expect(current_path).to eq("/trails/#{trail.id}")
  end
end
