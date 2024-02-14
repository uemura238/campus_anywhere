require 'rails_helper'
RSpec.describe 'UsersSignups', type: :system do
  scenario 'Don\'t create new data when user submits invalid information' do
    visit signup_path
    fill_in 'name', with: ' '
    fill_in 'Email', with: 'user@invalid'
    fill_in 'Password', with: 'foo'
    fill_in 'Password (2回目)', with: 'bar'
    click_on '登録'
    aggregate_failures do
      expect(current_path).to eq signup_path
      expect(page).to have_content '必要情報の記入をお願いいたします。'
      expect(page).to have_content 'failed. Please try again.'
    end
  end
end
