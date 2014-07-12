class ChangeMessageDataType < ActiveRecord::Migration
  def up
    remove_column :posts, :body
    add_column :posts, :body, :text
  end

  def down
    remove_column :posts, :body
    add_column :posts, :body, :string
  end
end
