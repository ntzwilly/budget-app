require 'rails_helper'

RSpec.feature 'Operations Index Page', type: :feature do
  before(:each) do
    visit new_user_session_path
    @user = User.new(name: 'Willy', email: 'willy@mail.com', created_at: Time.now, password: 'asdzxc')
    @category = Category.create!(name: 'Category1', icon: 'logo.png', user: @user)

    fill_in 'Email', with: 'willy@mail.com'
    fill_in 'Password', with: 'asdzxc'
    click_button 'Log in'
  end

  describe 'GET /index' do
    scenario 'I should see the categories page' do
      expect(page).to have_content 'CATEGORIES'
    end

    scenario 'I should be redirected to add new category page' do
      click_link 'NEW CATEGORY'
      expect(current_path).to eq new_category_path
    end

    scenario 'I should see categories list with name and total amount and date button in the body' do
      expect(page).to have_content 'Category1'
      expect(page).to have_content 0
      expect(page).to have_content '18 Feb 2022'
    end
  end
end
