class AddAllocationTypeIdToAllocations < ActiveRecord::Migration
  def change
  	change_table :allocations do |t|
  		t.remove :allocation_type_id
  		t.references :allocation_type
  	end
  end
end
