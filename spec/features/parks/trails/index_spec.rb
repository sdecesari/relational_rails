require 'rails_helper'

RSpec.describe 'parks trails index' do
  it "user story 5: can see each trail that belongs to the park" do
    park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
    trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
    trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
    trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

    visit "/parks/#{park.id}/trails"

    expect(page).to have_content(trail_1.name)
    expect(page).to have_content(trail_2.name)
    expect(page).to have_content(trail_3.name)
  end

  it "user story 5: can see all attributes for trails" do
    park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
    trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
    trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
    trail_3 = park.trails.create!(name: "North dome Trail", difficulty: 3, open: true)

    visit "/parks/#{park.id}/trails"

    expect(page).to have_content(trail_1.difficulty)
    expect(page).to have_content(trail_1.open)
    expect(page).to have_content(trail_2.difficulty)
    expect(page).to have_content(trail_2.open)
    expect(page).to have_content(trail_3.difficulty)
    expect(page).to have_content(trail_3.open)
  end

  it "user story 8: can take you back to trail index" do
    park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}/trails"
    expect(page).to have_link("Trails")
    click_link 'Trails'
    expect(current_path).to eq('/trails')
  end

  it "user story 9: can take you back to park index" do
    park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)
    

    visit "/parks/#{park.id}/trails"
    expect(page).to have_link("Parks")
    click_link 'Parks'
    expect(current_path).to eq('/parks')
  end

  it "user story 16: has a link to sory trail alphabetically" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}/trails"

    expect(page).to have_link("Sort by Name")
    click_link "Sort by Name"
    expect(current_path).to eq("/parks/#{park.id}/trails")
  end

  it "user story 21: can display trail over a given threshold" do 
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    trail_1 = park.trails.create!(name: "Cook's Meadow Trail", difficulty: 1, open: true)
    trail_2 = park.trails.create!(name: "The Mist Trail", difficulty: 2, open: true)
    trail_3 = park.trails.create!(name: "North Dome Trail", difficulty: 3, open: true)

    visit "/parks/#{park.id}/trails"

    fill_in 'difficulty', with: '2'
    click_button 'Submit'
    
    expect(page).to have_button('Submit')
    expect(page).to have_content("North Dome Trail")
    expect(page).to_not have_content("Cook's Meadow Trail")
    expect(page).to_not have_content("The Mist Trail")
  end 
end
