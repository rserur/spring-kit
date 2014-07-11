class AddMessaging < ActiveRecord::Migration
  def change
    add_column :posts, :message, :boolean, default: false
  end
end
