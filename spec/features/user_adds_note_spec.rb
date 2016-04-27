require 'rails_helper'

feature "user may add notes to their vacation", js: true do
  let!(:skywalker) { FactoryGirl.create(:vacation) }

  scenario "successfully adds note" do
    visit vacation_path(skywalker)

    expect(page).to have_content 'Add note'

    fill_in 'note_body', with: 'Check out Mos Eisley!'
    click_button 'Add'

    expect(page).to have_content 'Check out Mos Eisley!'
  end

  # scenario "unsuccessfully adds note" do
  #   visit vacation_path(skywalker)
  #
  #   expect(page).to have_content 'Add note'
  #   click_button 'Add'
  #
  #   expect(page).to have_content "Body can't be blank"
  # end
end
