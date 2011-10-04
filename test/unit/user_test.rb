require 'test_helper'
require 'test/unit'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
test "first test case" do
  assert true
end
test "user should not be null" do
  user = User.new
  assert_false user.valid?
end
end
