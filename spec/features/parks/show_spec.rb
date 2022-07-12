require 'rails_helper'

RSpec.describe 'park show page', type: :feature do
  it "user story 2: can show the park by id with its attributes" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}"

    expect(page).to have_content(park.name)
    expect(page).to have_content(park.cost)
    expect(page).to have_content(park.daily_visitors)
  end

  it "user story 10: can take you back to parent trail index" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}"

    expect(page).to have_link("Park Trails", :href=>"/parks/#{park.id}/trails")
    click_link 'Park Trails'
    expect(current_path).to eq("/parks/#{park.id}/trails")
  end
end
