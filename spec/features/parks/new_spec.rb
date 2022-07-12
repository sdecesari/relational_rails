require 'rails_helper'

RSpec.describe 'the park creation', type: :feature do
  it "User story 11: links to the new page from the park index" do
    visit '/parks'
    click_link 'New Park'

    expect(current_path).to eq('/parks/new')
  end

  it "User story 11: can create a new park" do
    visit 'parks/new'
    fill_in('name', with: "Zion National Park")
    fill_in('cost', with: true)
    fill_in('daily_visitors', with: 98399)
    click_button 'Create Park'

    expect(current_path).to eq("/parks")
    expect(page).to have_content("")
  end

end
