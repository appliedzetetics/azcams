class AddDefaultAppointmentCountToAllocationType < ActiveRecord::Migration
  def change
  	add_column :allocation_types, :default_appointment_count, :integer, :null => false, :default => 1
  end
end
