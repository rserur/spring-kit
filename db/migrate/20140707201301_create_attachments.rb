class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.string :type, null: false
      t.string :name, null: false
      t.string :url, null: false
      t.integer :post_id, null: false

      t.timestamps
    end
  end
end
