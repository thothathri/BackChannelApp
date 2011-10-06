require 'test_helper'

class PostsVotesControllerTest < ActionController::TestCase
    fixtures:posts
    fixtures:users

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_votes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_vote" do
    assert_difference('PostsVote.count') do
      post :create, posts_vote: @posts_vote.attributes
    end

    assert_redirected_to posts_vote_path(assigns(:posts_vote))
  end

  test "should show posts_vote" do
    get :show, id: @posts_vote.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_vote.to_param
    assert_response :success
  end

  test "should update posts_vote" do
    put :update, id: @posts_vote.to_param, posts_vote: @posts_vote.attributes
    assert_redirected_to posts_vote_path(assigns(:posts_vote))
  end

  test "should destroy posts_vote" do
    assert_difference('PostsVote.count', -1) do
      delete :destroy, id: @posts_vote.to_param
    end

    assert_redirected_to posts_votes_path
  end

  #########

test "User should not vote own post" do
    session[:current_user_id]= posts(:one).user_id
    get :new, :post_id=>posts(:one).id

    assert_equal(flash[:notice],"The user cannot vote his own posts/replies")
   # assert_redirected_to(:controller=>:posts, :action=>:index)
  end



end
