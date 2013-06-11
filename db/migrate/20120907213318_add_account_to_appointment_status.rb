class AddAccountToAppointmentStatus < ActiveRecord::Migration
  def change
    add_column :appointment_statuses, :account_id, :integer, :null => false, :default => 1
  end
  
end
