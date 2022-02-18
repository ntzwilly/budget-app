require 'rails_helper'

RSpec.feature 'Signup', type: :feature do
  it 'Signing up as a new user' do
    visit new_user_registration_path
    within 'form' do
      fill_in 'Name', with: 'Ntazama Willy'
      fill_in 'Email', with: 'ntazamawilly@mail.com'
      fill_in 'Password', with: 'asdzxc'
      fill_in 'Confirm password', with: 'asdzxc'
    end
    click_button 'Next'
    expect(page).to have_content 'You have signed up successfully.'
  end

  it 'Signing up with wrong informations' do
    visit new_user_registration_path
    within 'form' do
      fill_in 'Name', with: 'Ntazama Willy'
      fill_in 'Email', with: 'willy@mail.com'
      fill_in 'Password', with: 'asdzxc'
      fill_in 'Confirm password', with: 'abcdef'
    end
    click_button 'Next'
    expect(page).to have_content 'Password confirmation doesn\'t match Password'
  end
end
