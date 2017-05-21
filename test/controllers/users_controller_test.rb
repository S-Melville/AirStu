require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
	
	def setup
		@user = users(:koce)
		@other_user = users(:boce)
	end 


	test "should get new" do
		get new_user_registration_path
		assert_response :success
		assert_select "title", "Sign up | WeRent"
	end

	test "should get edit" do
		log_in_as(@user)
		get edit_user_registration_path
		assert_response :found
	  	#assert_select "title", "Edit Profile | WeRent"
	  	assert_not flash.empty?
	  	assert_redirected_to user_session_path
  	
  end 

  
end