class RemovePostIdFromCommentsVotes < ActiveRecord::Migration
  def up
    remove_column :comments_votes, :post_id
  end

  def down
    add_column :comments_votes, :post_id, :integer
  end
end
