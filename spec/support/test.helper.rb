module TestHelper
  def is_logged_in?
    !session[:user_id].nil?
  end
end

module SystemHelper
  def login_as(user)
    visit new_path
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
  end
end

RSpec.configure do |config|
  config.include TestHelper
  config.include SystemHelper  # <=  追加
end
