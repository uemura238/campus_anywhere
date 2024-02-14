require 'rails_helper'

RSpec.describe 'UsersEdits', type: :system do
  let(:user) { FactoryBot.create(:user) }

  it 'it fails edit with wrong information' do
    login_as(user)
    click_on '登録情報変更'
    fill_in 'Name', with: ' '
    fill_in 'Email', with: 'user@invalid'
    fill_in 'Password', with: 'foo'
    fill_in 'Password (2回目)', with: 'bar'
    click_on '変更を保存'
    aggregate_failures do
      expect(current_path).to eq user_path(user)
      # expect(has_css?('.alert-danger')).to be_truthy
    end
  end

  it 'it succeeds edit with correct information' do
    login_as(user)
    click_on '登録情報変更'
    fill_in 'Name', with: 'Foo Bar'
    fill_in 'Email', with: 'foo@bar.com'
    fill_in 'Password', with: ''
    fill_in 'Password (2回目)', with: ''
    click_on '変更を保存'
    aggregate_failures do
      expect(current_path).to eq user_path(user)
      # expect(has_css?('.alert-success')).to be_truthy
    end
  end
end
