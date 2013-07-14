class CreateTriggers < ActiveRecord::Migration
  def change
    create_table :triggers do |t|
      t.references :allocation_type
      t.references :trigger_type
      t.integer :object_id

      t.timestamps
    end
    add_index :triggers, :allocation_type_id
    add_index :triggers, :trigger_type_id
  end
end
