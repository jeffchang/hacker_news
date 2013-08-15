class CreatePostsAndComments < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :description
      t.integer :user_id
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.integer :user_id, :post_id
      t.timestamps
    end
  end
end
