class RestorePostBodyReq < ActiveRecord::Migration
  def up
    change_column :posts, :body, :text, null: false
  end

  def down
    change_column :posts, :body, :text, null: true
  end
end
