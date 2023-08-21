class AddViewsAndLikesToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :views, :integer, :default => 0, :null => false
    add_column :posts, :likes, :integer, :default => 0, :null => false
  end
end
