require 'rails_helper'

RSpec.describe 'trails show page', type: :feature do
  it "user story 4: can show the trail by id with its attributes" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)

    visit "/trails/#{trail.id}"

    expect(page).to have_content(trail.name)
    expect(page).to have_content(trail.difficulty)
    expect(page).to have_content(trail.open)
  end

  it "user story 14: see link to update trail" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)

    visit "/trails/#{trail.id}"

    expect(page).to have_link("Update #{trail.name}")
    click_link "Update #{trail.name}"
    expect(current_path).to eq("/trails/#{trail.id}/edit")
  end
end
