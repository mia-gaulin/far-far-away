require 'rails_helper'

feature "user cancels vacation" do
  let!(:skywalker) { FactoryGirl.create(:vacation) }

  scenario "user may cancel vacation from show page" do
    visit vacation_path(skywalker)

    expect(page).to have_button "Cancel Vacation"
    click_button "Cancel Vacation"

    expect(page).to have_content "Your vacation has been cancelled."
    expect(current_path).to eq planets_path
  end
end
