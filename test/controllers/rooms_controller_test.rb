require 'test_helper'



class RoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get rooms_path
    assert_response :found
  end

  test "should get show" do
    get rooms_path
    assert_response :found
  end

  test "should get new" do
    get new_room_path(@room)
    assert_response :found
  end

  test "should get create" do
    post rooms_path
    assert_response :found
  end

  test "should get edit" do
    get rooms_path(@rooms)
    assert_response :found
     assert_not flash.empty?
  end

  

end
