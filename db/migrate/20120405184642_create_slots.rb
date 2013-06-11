class CreateSlots < ActiveRecord::Migration
  def change
    create_table :slots do |t|
      t.references :clinic
      t.time :start_time

      t.timestamps
    end
    add_index :slots, :clinic_id
    add_foreign_key :slots, :clinics, :dependent => :delete

  end
end
