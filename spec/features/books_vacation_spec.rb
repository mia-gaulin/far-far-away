require 'rails_helper'

feature "visitor sees details for a planet" do
  let!(:tatooine) { FactoryGirl.create(:planet) }
  let(:skywalker) { FactoryGirl.create(:vacation) }
  let!(:anakin) { FactoryGirl.create(:user) }

  scenario "visitor may book a vacation from show page" do
    visit planets_path
    click_link tatooine.name

    expect(page).to have_content "Book travel"

    expect(page).to have_content "Name for Reservation"
    expect(page).to have_content "Start Date"
    expect(page).to have_content "End Date"
    expect(page).to have_content "Number of People"
  end

  scenario "visitor books a vacation from show page" do
    visit planets_path
    click_link tatooine.name

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

    expect(page).to have_selector("input[value='Skywalker']")
  end

  scenario "unsuccessful booking" do
    visit planets_path
    click_link tatooine.name

    fill_in "Start Date", with: skywalker.start_date
    fill_in "End Date", with: skywalker.end_date
    fill_in "Number of People", with: skywalker.num_of_people
    click_button "Submit"

    expect(page).to have_content "Vacationer can't be blank"
  end

  scenario "incorrect dates" do
    visit planets_path
    click_link tatooine.name

    fill_in "Name for Reservation", with: skywalker.vacationer
    fill_in "Start Date", with: skywalker.end_date
    fill_in "End Date", with: skywalker.start_date
    fill_in "Number of People", with: skywalker.num_of_people
    click_button "Submit"

    expect(page).to have_content "End date can't be before start date"
  end
end
