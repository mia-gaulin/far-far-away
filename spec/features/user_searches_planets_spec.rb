require 'rails_helper'

feature 'user searches for a planet' do
  let!(:tatooine) { FactoryGirl.create(:planet) }
  let!(:alderaan) { FactoryGirl.create(:planet, name: "Alderaan") }
  let!(:endor) { Planet.create(name: "Endor", language: "none", sector: "herp", region: "derp", description: "lol") }

  scenario 'searches successfully' do
    visit planets_path

    fill_in 'query', with: tatooine.name
    click_button 'Search'

    expect(page).to have_content tatooine.name
    expect(page).to_not have_content alderaan.name
  end

  scenario 'searches lowercase' do
    visit planets_path

    fill_in 'query', with: tatooine.name.downcase
    click_button 'Search'

    expect(page).to have_content tatooine.name
    expect(page).to_not have_content alderaan.name
  end

  scenario "searches language" do
    visit planets_path

    fill_in 'query', with: "basic"
    click_button 'Search'

    expect(page).to have_content tatooine.name
    expect(page).to have_content alderaan.name
    expect(page).to_not have_content endor.name
  end

  scenario 'searches blank field' do
    visit planets_path

    fill_in 'query', with: ""
    click_button 'Search'

    expect(page).to have_content tatooine.name
    expect(page).to have_content alderaan.name
    expect(page).to have_content endor.name
  end
end
