require 'rails_helper'

feature "visitor sees a list of planets to visit" do
  let!(:tatooine) { FactoryGirl.create(:planet) }
  let!(:alderaan) { FactoryGirl.create(:planet, name: "Alderaan") }
  let!(:utapau) { FactoryGirl.create(:planet, name: "Utapau") }

  scenario "sees a list of planets" do
    visit planets_path

    expect(page).to have_content tatooine.name
  end

  scenario "planets are listed alphabetically" do
    visit planets_path

    expect(alderaan.name).to appear_before(tatooine.name)
  end

  scenario "index is paginated to have ten planets per page" do
    9.times do
      FactoryGirl.create(:planet)
    end

    visit planets_path

    expect(page).to have_content alderaan.name
    expect(page).to_not have_content utapau.name

    visit '/planets?page=2'

    expect(page).to have_content utapau.name
  end
end
