class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :allocation
      t.date :appointment_date, :null => false
      t.time :appointment_time, :null => false
      t.string :appointment_status
      t.string :outcome

      t.timestamps
    end
    add_index :appointments, :allocation_id
  end
end
