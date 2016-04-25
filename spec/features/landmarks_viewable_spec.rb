require 'rails_helper'

feature "a list of points of interest shows on planet show page" do
  let!(:tatooine) { FactoryGirl.create(:planet) }
  let!(:moseisley) { Landmark.create(name: "Mos Eisley", planet: tatooine) }
  scenario "user visits planet page & sees list of landmarks" do
    visit planets_path
    click_link tatooine.name

    expect(page).to have_content moseisley.name
  end

  scenario "user books vacation & sees landmarks" do
    skywalker = Vacation.create(start_date: "2017-04-19", end_date: "2017-04-26", num_of_people: "3", vacationer: "Anakin Skywalker", planet: tatooine)
    visit planets_path
    click_link tatooine.name
    expect(page).to have_content "Book travel"

    fill_in "Name for Reservation", with: skywalker.vacationer
    fill_in "Start Date", with: skywalker.start_date
    fill_in "End Date", with: skywalker.end_date
    fill_in "Number of People", with: skywalker.num_of_people
    click_button "Submit"

    expect(page).to have_content "Vacation booked successfully!"
    expect(page).to have_content moseisley.name
  end
end
