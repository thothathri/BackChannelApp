require 'test_helper'

class CommentsVotesControllerTest < ActionController::TestCase
  fixtures:users
  fixtures:posts
  fixtures:comments
  fixtures:comments_votes

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comments_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comments_vote" do
    assert_difference('CommentsVote.count') do
      post :create, comments_vote: @comments_vote.attributes
    end

    assert_redirected_to comments_vote_path(assigns(:comments_vote))
  end

  test "should show comments_vote" do
    get :show, id: @comments_vote.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comments_vote.to_param
    assert_response :success
  end

  test "should update comments_vote" do
    put :update, id: @comments_vote.to_param, comments_vote: @comments_vote.attributes
    assert_redirected_to comments_vote_path(assigns(:comments_vote))
  end

  test "should destroy comments_vote" do
    assert_difference('CommentsVote.count', -1) do
      delete :destroy, id: @comments_vote.to_param
    end

    assert_redirected_to comments_votes_path
  end

  test "User should not vote own comment " do
    session[:current_user_id]= comments(:one).user_id
    get :new, :comment_id=>comments(:one).id

    assert_equal(flash[:notice],"The user cannot vote his own replies")
   # assert_redirected_to(:controller=>:posts, :action=>:index)
  end

   #test "User should not vote more than once on a comment " do
    session[:current_user_id]= comments_votes(:one).post_id
    get :new, :comment_id=>comments_votes(:one).comment_id

    assert_equal(flash[:notice],"You have already voted")
   # assert_redirected_to(:controller=>:posts, :action=>:index)
  end
end
