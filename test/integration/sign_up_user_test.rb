require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  test "the  user sign Up, redirect to user page upon being successful" do
  #   assert true
    get signup_path
    assert_template 'users/new'
    #hitting the test db and checking if the user is successfully created or not
     assert_difference 'User.count', 1 do
      post_via_redirect users_path, user: { username: "yesh", email: "yesh@yesh.com", password: "password"}
    end
    #checking if its redirected to the user's page or  not
    assert_template 'users/show'
  end
end
