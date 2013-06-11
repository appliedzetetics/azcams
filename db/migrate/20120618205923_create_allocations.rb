class CreateAllocations < ActiveRecord::Migration
  def change
    create_table :allocations do |t|
      t.references :episode, :null => false
      t.references :practitioner, :null => false
      t.references :allocation_type, :null => false

      t.timestamps
    end
    add_index :allocations, :episode_id
    add_index :allocations, :practitioner_id
  end
end
