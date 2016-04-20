require 'rails_helper'

feature "User authentication" do
  anakin = FactoryGirl.create(:user)

  let(:skywalker) do
    FactoryGirl.create(:user)
  end

  scenario "successful sign up" do
    visit '/users/sign_up'
    fill_in "First name", with: anakin.first_name
    fill_in "Last name", with: anakin.last_name
    fill_in "Email", with: anakin.email
    fill_in "Password", with: anakin.password
    fill_in "Password confirmation", with: anakin.password

    click_button "Sign up"

    expect(page).to have_content "You have signed up successfully"
  end

  scenario "a profile is created on sign up" do
    visit '/users/sign_up'
    fill_in "First name", with: anakin.first_name
    fill_in "Last name", with: anakin.last_name
    fill_in "Email", with: anakin.email
    fill_in "Password", with: anakin.password
    fill_in "Password confirmation", with: anakin.password
    click_button "Sign up"

    visit locations_path
    click_link "View Profile"

    expect(page).to have_content anakin.first_name
  end

  scenario "unsuccessful sign up" do
    visit '/users/sign_up'
    fill_in "First name", with: anakin.first_name
    fill_in "Last name", with: anakin.last_name
    fill_in "Password", with: anakin.password
    fill_in "Password confirmation", with: anakin.password

    click_button "Sign up"

    expect(page).to have_content("Email can't be blank")
  end

  scenario "successful sign in" do
    visit 'users/sign_in'
    fill_in "Email", with: skywalker.email
    fill_in "Password", with: skywalker.password
    click_button "Log in"

    expect(page).to have_content "Signed in successfully."
  end

  scenario "unsuccessfully sign-in with incorrect data" do
    visit 'users/sign_in'
    fill_in "Email", with: skywalker.email
    click_button "Log in"

    expect(page).to have_content "Invalid email or password."
  end

  scenario "successful sign out" do
    visit 'users/sign_in'
    fill_in "Email", with: skywalker.email
    fill_in "Password", with: skywalker.password
    click_button "Log in"
    visit '/'
    click_link "Log Out"

    expect(page).to have_content "Signed out successfully."
  end
end
