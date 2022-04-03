require 'rails_helper'

RSpec.describe 'FirstPages', type: :system do
  it '「/」 にアクセスした場合,タイトルは「Campus Anywhere」です' do
    visit root_path
    aggregate_failures do
      expect(page.title).to eq 'Campus Anywhere'
      expect(page).to have_link 'Campus Anywhere', href: root_path
      expect(page).to have_link 'Help',       href: help_path
      expect(page).to have_link 'About',      href: about_path
      expect(page).to have_link 'Contact',    href: contact_path
      expect(page).to have_link 'Sign up Now!',     href: signup_path
    end
  end
end
