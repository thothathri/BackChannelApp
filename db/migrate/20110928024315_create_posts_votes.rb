class CreatePostsVotes < ActiveRecord::Migration
  def change
    create_table :posts_votes do |t|
      t.references :post
      t.references :user

      t.timestamps
    end
    add_index :posts_votes, :post_id
    add_index :posts_votes, :user_id
  end
end
