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
    click_link 'Trails'

    expect(page).to have_link("Trails", :href=>"/trails")
  end

  it "user story 9: can take you back to park index" do
    visit '/trails'
    click_link 'Parks'

    expect(page).to have_link("Parks", :href=>"/parks")
  end
end
