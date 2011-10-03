require 'digest/sha2'

class User < ActiveRecord::Base
   validates :username, :presence => true
	 validates :password, :presence => true,
			  :length => { :minimum => 5}
   validates_uniqueness_of :username
  has_many :posts
end
