class DropAttachmentsTable < ActiveRecord::Migration
  def up
    drop_table :attachments
  end

  def down
    create_table :attachments do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.string :url, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
