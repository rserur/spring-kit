class CreateKits < ActiveRecord::Migration
  def change
    create_table :kits do |t|
      t.string :client_id, null: false
      t.string :practitioner_id, null: false

      t.timestamps
    end
  end
end
