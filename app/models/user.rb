class User < ActiveRecord::Base
   validates :username, :presence => true
	 validates :password, :presence => true,
			  :length => { :minimum => 5}
  has_many :posts
end
