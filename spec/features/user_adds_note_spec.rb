require 'rails_helper'

feature "vacations have notes", js: true do
  let!(:skywalker) { FactoryGirl.create(:vacation) }
  let!(:note) { Note.create(body: "Watch out for sandstorms", vacation: skywalker) }

  scenario "user successfully adds note" do
    visit vacation_path(skywalker)

    expect(page).to have_content 'Add note'

    fill_in 'note_body', with: 'Check out Mos Eisley!'
    click_button 'Add'

    expect(page).to have_content 'Check out Mos Eisley!'
  end

  scenario "user deletes note" do
    visit vacation_path(skywalker)

    expect(page).to have_content note.body
    click_on 'X'

    expect(page).to_not have_content note.body
  end
end
