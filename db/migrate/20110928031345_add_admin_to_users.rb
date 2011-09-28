class AddAdminToUsers < ActiveRecord::Migration
  def change
    User.create :username => "admin",
                :password => "admin123",
                :email => "tsriniv@ncsu.edu",
                :name => "Admin User",
                :phone =>"123-456-7890",
                :role => "admin"
  end
end
