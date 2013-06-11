class AddAppointmentCountToAllocation < ActiveRecord::Migration
  def change
    add_column :allocations, :appointment_count, :integer, :null => true
  end
end
