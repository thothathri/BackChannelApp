class AddUserIdToCommentsVotes < ActiveRecord::Migration
  def change
    add_column :comments_votes, :user_id, :integer
  end
end
