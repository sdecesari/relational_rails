require 'rails_helper'

RSpec.describe 'index page view', type: :feature do
  it "user story 1: when i visit the park index page i can see the name of the park" do
    Park.destroy_all
    park_1 = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    park_2 = Park.create!(name: "Yellowstone National Park", cost: true, daily_visitors: 8923)

    visit '/parks'

    expect(page).to have_content(park_1.name)
    expect(page).to have_content(park_1.cost)
    expect(page).to have_content(park_1.daily_visitors)
    expect(page).to have_content(park_2.name)
    expect(page).to have_content(park_2.cost)
    expect(page).to have_content(park_2.daily_visitors)
  end

  it "user story 8: can take you back to trail index" do
    visit '/parks'
    expect(page).to have_link("Trails")
    click_link 'Trails'
    expect(current_path).to eq('/trails')
  end

  it "user story 9: can take you back to park index" do
    visit '/parks'
    expect(page).to have_link("Parks")
    click_link 'Parks'
    expect(current_path).to eq('/parks')
  end

  it "user story 11: links to the new page from the park index" do
    visit '/parks'
    click_link 'New Park'

    expect(current_path).to eq("/parks/new")
  end

  it "user story 17: has a link to edit each park" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)
    visit '/parks'
    click_link "Update #{park.name}"
    expect(current_path).to eq("/parks/#{park.id}/edit")
  end
end
