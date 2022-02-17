require 'rails_helper'

RSpec.feature 'Transactions Index page', type: :feature do
  describe 'Login Page requirements' do
    background do
      @user = User.new(name: 'Willy', email: 'willy@mail.com', created_at: Time.now, password: 'asdzxc')
      @category = Category.create!(name: 'Category1', icon: 'logo.png', user: @user)
      @transaction = Entity.create(name: 'KFC', amount: 5, id: @category.id)
      # @join_tbl = CategoryEntity.create(category: @category, entity: @transaction)
      visit new_user_session_path
      fill_in 'user_email', with: @user.email
      fill_in 'user_password', with: @user.password
      click_button 'Log in'
      visit category_path(@category.id)
    end

    it 'Should see the page title' do
      expect(page).to have_content 'TRANSACTIONS'
    end

    it 'Should see the total amount' do
      expect(page).to have_content '$0'
    end

    it 'sees add category button' do
      expect(page).to have_link 'ADD NEW TRANSACTION'
    end
  end

  # Any test will fail bc of new google webdriver 98. can't use fill_in "@"
end