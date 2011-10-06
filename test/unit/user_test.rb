require 'test_helper'


class UserTest < ActiveSupport::TestCase
fixtures:users
 test "User is not valid without a unique UserName" do
  user = User.new(:username => users(:shruthi).username,
  :password => "yyyyyyy",
  :name => "abcd",
  :email => "abcds@gmail.com",
  :phone=>123-456-7891,
  :role=>"User")
 assert !user.save

 end

  test "User is not valid without a UserName" do
  user = User.new(:username =>"",
  :password => "yyyyyyy",
  :name => "abcd",
  :email => "abcds@gmail.com",
  :phone=>123-456-7891,
  :role=>"User")
 assert user.invalid?
  end

test "User is not valid without a Password" do
  user = User.new(:username => "userDad",
  :password => "",
  :name => "abcd",
  :email => "abcds@gmail.com",
  :phone=>123-456-7891,
  :role=>"User")
 assert user.invalid?

end

 test "User's Password length should be a minimum of 5 characters" do
  user = User.new(:username => "userDad",
  :password => "",
  :name => "abcd",
  :email => "abcds@gmail.com",
  :phone=>123-456-7891,
  :role=>"User")
 assert user.invalid?
 end

test "User is not valid without both Username & Password" do
  user = User.new(:username => "userDad",
  :password => "",
  :name => "",
  :email => "abcds@gmail.com",
  :phone=>123-456-7891,
  :role=>"User")
 assert user.invalid?
end

  test "Password should be encrypted and saved into the DB " do
  user = User.new(:username =>"XYZ",
  :password => "yyyyyyy",
  :name => "abcd",
  :email => "abcds@gmail.com",
  :phone=>123-456-7891,
  :role=>"User")
 assert user.save

 end
end
