class AddFieldsToPrintQueue < ActiveRecord::Migration
  def change
  	change_table :print_queues do |t|
  		t.boolean :printed, :default => true
	end  		
  end
end
