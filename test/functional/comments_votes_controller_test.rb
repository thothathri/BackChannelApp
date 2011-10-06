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


  test "should show comments_vote" do
    get :show, :id=>comments_votes(:cv1).id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id=>comments_votes(:cv1).id
    assert_response :success
  end

  test "should update comments_vote" do
    put :update, :id=>comments_votes(:cv1).id ,:comment_vote=>{:id=>comments_votes(:cv1).id,:comment_id=>comments_votes(:cv1).comment_id,:user_id=>comments_votes(:cv1).user_id}
    assert_redirected_to comments_vote_path(assigns(:comments_vote))
  end


  test "should destroy comments_vote" do
    assert_difference('CommentsVote.count', -1) do
      delete :destroy, :id=>comments_votes(:cv1).id
    end

    assert_redirected_to comments_votes_path
  end
end
