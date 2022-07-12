require 'rails_helper'

RSpec.describe 'edit park', type: :feature do
  it "user story 12: links to the edit page" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}"
    click_link "Update #{park.name}"

    expect(current_path).to eq("/parks/#{park.id}/edit")
  end

  it "user story 12: can edit the park attributes" do
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}/edit"

    fill_in('name', with: "Yosemite National Park")
    fill_in('cost', with: true)
    fill_in('daily_visitors', with: 98399)
    click_button 'Update Park'

    expect(current_path).to eq("/parks/#{park.id}")
  end
end
