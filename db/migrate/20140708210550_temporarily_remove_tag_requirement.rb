class TemporarilyRemoveTagRequirement < ActiveRecord::Migration
  def up
    change_column :posts, :tag_id, :integer, null: true
  end

  def down
    change_column :posts, :tag_id, :integer, null: false
  end
end
