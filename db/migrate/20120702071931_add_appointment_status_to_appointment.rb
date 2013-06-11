class AddAppointmentStatusToAppointment < ActiveRecord::Migration
  def change
    change_table :appointments do |t|
      t.references :appointment_status, :null => false
      t.remove :appointment_status
    end

  end
end
