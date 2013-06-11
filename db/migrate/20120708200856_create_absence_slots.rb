class CreateAbsenceSlots < ActiveRecord::Migration
  def change
    create_table :absence_slots do |t|
      t.references :absence
      t.time :time_from
      t.time :time_to

      t.timestamps
    end
    add_index :absence_slots, :absence_id
    add_index :absence_slots, :time_from
  end
end
