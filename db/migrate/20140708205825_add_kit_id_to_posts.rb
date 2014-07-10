class AddKitIdToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :kit_id, :integer, null: false
  end
end
