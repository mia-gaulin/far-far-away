require 'rails_helper'

feature "planet details page presents info from api" do

  scenario "visitor views api data on show page" do
    tatooine = FactoryGirl.create(:planet)
    visit planets_path
    click_link tatooine.name

    expect(page).to have_content("Climate:")
    expect(page).to have_content("Terrain:")
    expect(page).to have_content("Population:")
    expect(page).to have_content("Gravity:")
    expect(page).to have_content("Rotation period:")
    expect(page).to have_content("Orbital period:")
    expect(page).to have_content("Diameter:")
  end
end
