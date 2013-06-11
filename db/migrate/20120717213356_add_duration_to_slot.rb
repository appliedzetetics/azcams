class AddDurationToSlot < ActiveRecord::Migration
  def change
    add_column :slots, :duration, :time
  end
end
