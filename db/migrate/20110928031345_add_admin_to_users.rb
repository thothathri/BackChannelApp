class AddAdminToUsers < ActiveRecord::Migration
  def change
    User.create :username => "admin",
                :password => "8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918",
                :email => "tsriniv@ncsu.edu",
                :name => "Admin User",
                :phone =>"123-456-7890",
                :role => "admin"
  end
end
