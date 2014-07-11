class AddMessaging < ActiveRecord::Migration
  def change
    add_column :posts, :message, :boolean
  end
end
