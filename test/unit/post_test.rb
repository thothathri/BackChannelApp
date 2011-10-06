require 'test_helper'
class PostTest < ActiveSupport::TestCase
  fixtures:users
  fixtures:posts
test "Post should not be empty"   do

  post = Post.new(:topic =>"",:user_id =>users(:shruthi).id)

 assert post.invalid?

end
end

