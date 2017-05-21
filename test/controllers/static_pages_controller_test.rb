require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  
  test "should get home" do
    get search_path
    assert_response :success
  end

  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "About | WeRent"
  end
  
   test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "Contact | WeRent"
  end

end
