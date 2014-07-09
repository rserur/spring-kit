class AddIndexes < ActiveRecord::Migration
  def change
    add_index :kits, :client_id, unique: true
    add_index :attachments, :post_id, unique: true
    add_index :organizations, :name, unique: true
  end
end
