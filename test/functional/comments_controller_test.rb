require 'test_helper'

class CommentsControllerTest < ActionController::TestCase
  setup do
    @comment = comments(:comment1)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should show comment" do
    get :show, :id=>comments(:comment1).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id=>comments(:comment1).id
    assert_response :success
  end

  test "should update comment" do
    put :update, :id=>comments(:comment1).id,:comment=>{:id=>comments(:comment1).id,:user_id=>comments(:comment1).user_id,:post_id=>comments(:comment1).post_id,:reply=>"kjhdskdsa"}
    assert_redirected_to comment_path(assigns(:comment))
  end

end
