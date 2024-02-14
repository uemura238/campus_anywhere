require 'rails_helper'

RSpec.describe 'UsersLogins', type: :system do
  let(:user) { FactoryBot.create(:user) }
  it 'login succeeds when user submits valid information' do
    visit new_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    aggregate_failures do
      expect(current_path).to eq root_path
      expect(page).to have_no_link 'Login'
      expect(page).to have_link 'Log out', href: out_path
      expect(page).to have_link '登録情報変更', href: edit_user_path(user)
    end

    click_on 'Log out'
    aggregate_failures do
      expect(current_path).to eq root_path
      expect(page).to have_link 'Sign Up', href: signup_path
      expect(page).to have_link 'Log In', href: new_path
      expect(page).to have_no_link 'Log out'
      expect(page).to have_no_link '登録情報変更'
    end
  end
end
