class AddPhoneNumbers < ActiveRecord::Migration
  def change
    add_column :users, :phone, :string, limit: 10
  end
end
