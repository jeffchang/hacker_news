class CreatePostsAndComments < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, :description
      t.references :user
      t.timestamps
    end

    create_table :comments do |t|
      t.string :content
      t.references :user, :post
      t.timestamps
    end
  end
end
