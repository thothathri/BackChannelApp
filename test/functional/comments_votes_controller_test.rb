require 'test_helper'

class CommentsVotesControllerTest < ActionController::TestCase
  setup do
    @comments_vote = comments_votes(:one)
  end

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
end
