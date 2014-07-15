class ChangeRegistrationReqs < ActiveRecord::Migration
  def change
    change_column :users, :first_name, :string, null: true, default: ""
    change_column :users, :last_name, :string, null: true, default: ""
    change_column :users, :role, :string, default: "client"
  end
end
