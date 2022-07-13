require 'rails_helper'

RSpec.describe 'park trails new page' do
  it "user story 13: has a link to create a new trail from park trails index page" do
    park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}/trails"
    click_link 'Create Trail'

    expect(current_path).to eq ("/parks/#{park.id}/trails/new")
  end

  it "user story 13: can create a new trail" do
    park = Park.create!(name: "Yosimite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}/trails/new"

    fill_in('name', with: "Cook's Meadow Trail")
    fill_in('difficulty', with: 1)
    fill_in('open', with: true)
    click_button 'Create Trail'

    expect(current_path).to eq("/parks/#{park.id}/trails")
    expect(page).to have_content("Cook's Meadow Trail")
    expect(page).to have_content(1)
    expect(page).to have_content(true)
  end
end
