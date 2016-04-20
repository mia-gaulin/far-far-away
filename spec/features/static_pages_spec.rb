require 'rails_helper'

feature "static pages" do
  let!(:tatooine) { FactoryGirl.create(:planet) }

  scenario "user visits root path" do
    visit root_path

    expect(page).to have_content "Home Page"
    expect(page).to_not have_content tatooine.name
  end

  scenario "user visits about page" do
    visit root_path
    click_link "About"

    expect(page).to have_content "About Far, Far Away Travel"
    expect(page).to_not have_content tatooine.name
  end

  scenario "about page may be accessed from anywhere" do
    visit planets_path
    expect(page).to have_link "About"

    click_link tatooine.name
    expect(page).to have_link "About"
  end
end