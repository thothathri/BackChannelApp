require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  fixtures :comments
  fixtures :users
  fixtures :posts
  test "A reply should have some content" do
  comment = Comment.new(:reply =>"",:post_id=>posts(:one).id,:user_id=>users(:shruthi).id)

 assert comment.invalid?
  end
end
