require 'rails_helper'

RSpec.describe 'delete a park' do
  it "user story 19: has a link to delete a park from show page" do
    Park.destroy_all
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks/#{park.id}"
    click_link "Delete #{park.name}"
    expect(current_path).to eq ('/parks')
    expect(page).to_not have_content("Yosemite National Park")
  end

  it "user story 22: has a link to delete a park from index page" do
    Park.destroy_all
    park = Park.create!(name: "Yosemite National Park", cost: true, daily_visitors: 39839)

    visit "/parks"
    click_link "Delete #{park.name}"
    expect(current_path).to eq ('/parks')
    expect(page).to_not have_content("Yosemite National Park")
  end
end
