require 'rails_helper'

feature "user may add notes to their vacation" do
  let!(:skywalker) { FactoryGirl.create(:vacation) }

  scenario "successfully adds note" do
    visit vacation_path(skywalker)

    expect(page).to have_content 'Add note'

    fill_in 'note_body', with: 'Check out Mos Eisley!'
    click_button 'Add'

    expect(page).to have_content 'Check out Mos Eisley!'
  end
end
