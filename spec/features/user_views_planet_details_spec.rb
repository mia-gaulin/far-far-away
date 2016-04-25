require 'rails_helper'

feature "visitor sees details for a planet" do
  let!(:tatooine) { FactoryGirl.create(:planet) }

  scenario "clicks link and is taken to show page for planet" do
    visit planets_path

    click_link tatooine.name

    expect(page).to have_content tatooine.name
    expect(page).to have_content tatooine.language
    expect(page).to have_content tatooine.sector
    expect(page).to have_content tatooine.region
    expect(page).to have_content tatooine.description
  end
end
