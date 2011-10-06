require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures :comments
  fixtures :users
  fixtures :posts
  test "A reply should have some content" do
  comment = Comment.new(:reply =>"",:post_id=>comments(:comment1).post_id,:user_id=>comments(:comment1).user_id)

 assert comment.invalid?
  end
end
