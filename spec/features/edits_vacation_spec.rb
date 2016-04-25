require 'rails_helper'

feature "user views and edits their vacation" do
  let!(:tatooine) { FactoryGirl.create(:planet) }
  let!(:skywalker) { FactoryGirl.create(:vacation) }

  scenario "booking a vacation redirects to vacation show page" do
    visit planets_path
    click_link tatooine.name
    expect(page).to have_content "Book travel"

    fill_in "Name for Reservation", with: "Skywalker"
    fill_in "Start Date", with: "2017-04-17"
    fill_in "End Date", with: "2017-04-26"
    fill_in "Number of People", with: "3"
    click_button "Submit"

    expect(page).to have_content "Vacation booked successfully!"
    expect(page).to have_content "Skywalker"
    expect(page).to have_content tatooine.name
  end

  scenario "user may edit vacation" do
    visit vacation_path(skywalker)

    expect(page).to have_content skywalker.num_of_people
    expect(page).to have_link "Edit"
    click_link "Edit"

    fill_in "End Date", with: "2017-05-10"
    click_button "Update Vacation"

    expect(page).to have_content "2017-05-10"
    expect(page).to have_content skywalker.start_date
    expect(page).to_not have_content skywalker.end_date
    expect(page).to have_content "Vacation updated successfully!"
    expect(current_path).to eq vacation_path(skywalker)
  end

  scenario "user updates vacation with incorrect info" do
    visit vacation_path(skywalker)

    expect(page).to have_content skywalker.num_of_people
    expect(page).to have_link "Edit"
    click_link "Edit"

    fill_in "Number of People", with: "two"
    click_button "Update Vacation"

    expect(page).to have_content "Num of people is not a number"
  end
end
