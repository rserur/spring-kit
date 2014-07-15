class RemoveUserNameRequirements < ActiveRecord::Migration
  def up
    change_column :users, :first_name, :string, null: true
    change_column :users, :last_name, :string, null: true
    change_column :users, :organization_id , :integer, null: true
    change_column :users, :role, :string, null: true
  end

  def down
    change_column :users, :first_name, :string, null: false
    change_column :users, :last_name, :string, null: false
    change_column :users, :organization_id , :integer, null: false
    change_column :users, :role, :string, null: false
  end
end
