require 'rails_helper'

RSpec.feature 'Splash', type: :feature do
  it 'Display splash screen' do
    visit root_path
    expect(page).to have_content 'Budgetplus'
    expect(page).to have_link 'LOG IN'
    expect(page).to have_link 'SIGN UP'
  end

  it 'Clicking Login opens login page' do
    visit root_path
    click_link 'LOG IN'
    expect(page).to have_current_path(new_user_session_path)
  end

  it 'Clicking Signup opens signup page' do
    visit root_path
    click_link 'SIGN UP'
    expect(page).to have_current_path(new_user_registration_path)
  end
end
