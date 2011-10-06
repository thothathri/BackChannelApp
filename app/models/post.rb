class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :posts_votes
  validates :topic,:presence=>true
end
