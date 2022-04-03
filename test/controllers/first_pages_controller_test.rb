require 'test_helper'

class FirstPagesControllerTest < ActionDispatch::IntegrationTest
  test 'should get home' do
    get first_pages_home_url
    assert_response :success
  end

  test 'should get help' do
    get first_pages_help_url
    assert_response :success
  end

  test 'should get about' do
    get first_pages_about_url
    assert_response :success
  end

  test 'should get contact' do
    get first_pages_contact_url
    assert_response :success
  end
end
