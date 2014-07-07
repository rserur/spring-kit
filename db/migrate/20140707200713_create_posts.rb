class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :recipient_id, null: false
      t.integer :sender_id, null: false
      t.integer :tag_id, null: false
      t.string :title
      t.string :body, null: false
      t.integer :attachment_id

      t.timestamps
    end
  end
end
