require 'digest/sha2'

class User < ActiveRecord::Base
   validates :username, :presence => true   #checking for presence of username, password, etc.
	 validates :password, :presence => true,
			  :length => { :minimum => 5}
   validates_uniqueness_of :username
   validates_uniqueness_of :name
   has_many :posts
  def self.create_encrypted_password(password)
    return Digest::SHA2.hexdigest(password)
  end
  def self.cascade_delete(user)
     @comments_vote = CommentsVote.find_all_by_user_id(user.id)
     for c_v in @comments_vote
        c_v.destroy
     end
     @comments = Comment.find_all_by_user_id(user.id)
     for cmt in @comments
       cmt.destroy
     end
     @posts_vote = PostsVote.find_all_by_user_id(user.id)
     for p_v in @posts_vote
       p_v.destroy
     end
     @posts = Post.find_all_by_user_id(user.id)
     for p in @posts
       p.destroy
     end
     user.destroy
  end

end
