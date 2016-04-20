require 'rails_helper'

feature "once a vacation is booked user may add an itinerary" do
  let(:skywalker) { FactoryGirl.create(:vacation) }

  scenario "user views itinerary link" do
    tatooine = FactoryGirl.create(:planet)

    visit planets_path
    click_link tatooine.name
    click_link "Book travel"

    fill_in "Name for Reservation", with: skywalker.vacationer
    fill_in "Start Date", with: skywalker.start_date
    fill_in "End Date", with: skywalker.end_date
    fill_in "Number of People", with: skywalker.num_of_people
    click_button "Submit"

    expect(page).to have_link "Build an Itinerary"
  end

  scenario "views list of events available for planet" do
    FactoryGirl.create(:event)

    visit vacation_path(skywalker)
    click_link "Build an Itinerary"

    expect(page).to have_content "Events on"
    expect(page).to have_content skywalker.planet.name
  end
end
