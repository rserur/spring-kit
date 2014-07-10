class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.integer :client_id, null: false
      t.integer :practitioner_id, null: false

      t.timestamps
    end
  end
end
