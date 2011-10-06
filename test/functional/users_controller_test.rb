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

  test "should show user" do
    get :show, :search_by_user_query=>users(:shruthi).name
    assert_response :success
  end


  test "should update user" do
    put :update, id: @user.to_param, user: @user.attributes
    assert_redirected_to user_path(assigns(:user))
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, :user=>{:username=>"lol", :password=>"hashed"}
    end

    assert_redirected_to(:controller=>:users, :action=>:log)
  end

  test "should search by content" do
     get :search_by_content, :search_by_content_query=>"patter"
     assert_response :success

  end

  test "Bad search by content" do
     get :search_by_content, :search_by_content_query=>"cant"
    assert_redirected_to(:controller => :users, :action => :content_not_found, notice: 'No such content found!')
  end

  test "search" do
    get :search, :search_by_user_query=>users(:shruthi).name
    assert_response :success
  end
  test "bad search" do
    get :search, :search_by_user_query=>"jay"
     assert_redirected_to(:controller => :users,:action => :user_not_found, notice: 'No such user exists' )
  end
  test "username is wrong while logging in" do
    get :login,:user=>{:username=>"lol", :password=>"hashed"}
    assert_redirected_to(:controller => 'main',:action => 'index')
   end
   test "successful login and user is admin" do
     get :login,:user=>{:username=>users(:shruthi).username,:password=>users(:shruthi).password,:current_user_id=>users(:shruthi).id}
     assert_redirected_to(:controller => 'users',:action => 'admin_user' )
   end

   test "successful login and user is user" do
     get :login,:user=>{:username=>users(:sandhya).username,:password=>users(:sandhya).password,:current_user_id=>users(:ravi).id}
     assert_redirected_to(:controller => 'posts',:action => 'index' )
   end

end