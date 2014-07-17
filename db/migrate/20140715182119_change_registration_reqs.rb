class ChangeRegistrationReqs < ActiveRecord::Migration
  def up
    change_column :users, :first_name, :string, null: true, default: ""
    change_column :users, :last_name, :string, null: true, default: ""
    change_column :users, :role, :string, default: "client"
  end

  def down
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
    change_column :users, :role, :string
  end
end
