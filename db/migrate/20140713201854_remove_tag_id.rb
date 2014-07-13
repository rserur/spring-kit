class RemoveTagId < ActiveRecord::Migration
  def up
    remove_column :posts, :tag_id
  end

  def down
    add_column :posts, :tag_id, :integer
  end
end
