# require 'rails_helper'
#
# feature "once a vacation is booked user may add an itinerary" do
#   let(:skywalker) { FactoryGirl.create(:vacation) }
#
#   scenario "user views itinerary options" do
#     tatooine = FactoryGirl.create(:planet)
#
#     visit planets_path
#     click_link tatooine.name
#     expect(page).to have_content "Book travel"
#
#     fill_in "Name for Reservation", with: skywalker.vacationer
#     fill_in "Start Date", with: skywalker.start_date
#     fill_in "End Date", with: skywalker.end_date
#     fill_in "Number of People", with: skywalker.num_of_people
#     click_button "Submit"
#
#     expect(page).to have_content "Book events on #{tatooine.name}"
#   end
#
#   scenario "user adds event to itinerary" do
#     event = Event.create(name: "Podracing", planet: skywalker.planet)
#
#     visit vacation_path(skywalker)
#     expect(page).to_not have_content "Bookings"
#
#     check 'event_id'
#     click_button 'Add to trip'
#
#     expect(page).to have_content "Bookings"
#   end
# end
