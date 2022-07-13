require 'rails_helper'

RSpec.describe 'index page view' do
  it "user story 3: when i visit trail index page i can see the name of the trail" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)

    visit '/trails'

    expect(page).to have_content(trail.name)
  end

  it "user story 8: can take you back to trail index" do
    visit '/trails'
    expect(page).to have_link("Trails")
    click_link 'Trails'
    expect(current_path).to eq('/trails')
  end

  it "user story 9: can take you back to park index" do
    visit '/trails'
    expect(page).to have_link("Parks")
    click_link 'Parks'
    expect(current_path).to eq('/parks')
  end 

  it "user story 18: has a link to edit each trail" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
    visit '/trails'
    click_link "Update #{trail.name}"
    expect(current_path).to eq("/trails/#{trail.id}/edit")
  end

end
