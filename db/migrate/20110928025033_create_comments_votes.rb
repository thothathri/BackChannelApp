class CreateCommentsVotes < ActiveRecord::Migration
  def change
    create_table :comments_votes do |t|
      t.references :post
      t.references :comment

      t.timestamps
    end
    add_index :comments_votes, :post_id
    add_index :comments_votes, :comment_id
  end
end
