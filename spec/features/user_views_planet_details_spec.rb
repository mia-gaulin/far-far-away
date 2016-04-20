require 'rails_helper'

feature "visitor sees details for a planet" do
  let!(:tatooine) { FactoryGirl.create(:planet) }
  let(:skywalker) { FactoryGirl.create(:vacation) }
  let!(:anakin) { FactoryGirl.create(:user) }

  scenario "clicks link and is taken to show page for planet" do
    visit planets_path

    click_link tatooine.name

    expect(page).to have_content tatooine.name
    expect(page).to have_content tatooine.language
    expect(page).to have_content tatooine.sector
    expect(page).to have_content tatooine.region
    expect(page).to have_content tatooine.description
  end

  scenario "visitor may book a vacation from show page" do
    visit planets_path
    click_link tatooine.name

    expect(page).to have_link "Book travel"
    click_link "Book travel"

    expect(page).to have_content "Name for Reservation"
    expect(page).to have_content "Start Date"
    expect(page).to have_content "End Date"
    expect(page).to have_content "Number of People"
  end

  scenario "visitor books a vacation from show page" do
    visit planets_path
    click_link tatooine.name
    click_link "Book travel"

    fill_in "Name for Reservation", with: skywalker.vacationer
    fill_in "Start Date", with: skywalker.start_date
    fill_in "End Date", with: skywalker.end_date
    fill_in "Number of People", with: skywalker.num_of_people
    click_button "Submit"

    expect(page).to have_content "Vacation booked successfully!"
  end

  scenario "if user is signed in, form is pre-filled with their name" do
    visit root_path
    click_link "Sign In"
    fill_in "Email", with: anakin.email
    fill_in "Password", with: anakin.password
    click_button "Log in"

    visit planets_path
    click_link tatooine.name
    click_link "Book travel"

    expect(page).to have_selector("input[value='Skywalker']")
  end
end
