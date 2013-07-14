class AddAccountToAllocationTypes < ActiveRecord::Migration
  def change
    add_column :allocation_types, :account_id, :integer, :null => false, :default => 0
  end
end
