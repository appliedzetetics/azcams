class CreateAppointmentStatuses < ActiveRecord::Migration
  def change
    create_table :appointment_statuses do |t|
      t.string :description, :null => false
      t.boolean :is_dna, :null => false
      t.boolean :is_cancellation, :null => false
      t.boolean :is_attended, :null => false

      t.timestamps
    end
  end
end
