require 'test_helper'

class PostsControllerTest < ActionController::TestCase
      fixtures:users
      fixtures:posts

  test "should get index" do

    get :index
    assert_response :success
    assert_not_nil assigns(:posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end


  test "should show post" do
    get :show, :id=>posts(:post1).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id=>posts(:post1).id
    assert_response :success
  end

  test "should update post" do
    put :update, :id=>posts(:post1).id
    assert_redirected_to post_path(assigns(:post))
  end

  test "should destroy post" do
    assert_difference('Post.count', -1) do
      delete :destroy, :id=>"1"
    end

    assert_redirected_to posts_path
  end

  #####ourtests####
  test "should create new post" do
    assert_difference('Post.count') do
     session[:current_user_id]=100
      post :create, :post=> {:topic=>"Examination result",:user_id=>100 }
    end

    #assert_redirected_to post_path(assigns(:post))
  end

end
