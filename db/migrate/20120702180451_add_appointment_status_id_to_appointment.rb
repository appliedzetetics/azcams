class AddAppointmentStatusIdToAppointment < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.remove :appointment_status_id
      t.references :appointment_statuses, :null => true
    end
  end
end
