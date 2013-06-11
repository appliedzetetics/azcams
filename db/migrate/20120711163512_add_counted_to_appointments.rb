class AddCountedToAppointments < ActiveRecord::Migration
  def change
    add_column :appointments, :counted, :boolean
  end
end
