require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  fixtures:users
  setup do
    @user = users(:ravi)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should get edit" do
    get :edit, id: @user.to_param
    assert_response :success
  end


  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user.to_param
    end

    assert_redirected_to users_path
  end

  test "should search by content" do
     get :search_by_content, :search_by_content_query=>"hel"
     assert_response :success

  end

  test "search" do
    get :search, :search_by_user_query=>users(:ravi).username
    assert_response :success
  end
  test "bad search" do
    get :search, :search_by_user_query=>"jay"
     assert_redirected_to(:controller => :users,:action => :user_not_found, notice: 'No such user exists' )
  end
  test "no user" do
   get :login,:user=>{:username=>"lol", :password=>"hashed"}
    assert_redirected_to(:controller => 'main',:action => 'index')
  end
  test "username is wrong while logging in" do
    get :login,:user=>{:username=>"lol", :password=>"hashed"}
    assert_redirected_to(:controller => 'main',:action => 'index')
   end

end