class AddAccountToEverything < ActiveRecord::Migration
  def change
    	add_column :clients, :account_id, :integer, :null => false, :default => 0
    	add_column :venues, :account_id, :integer, :null => false, :default => 0
    	add_column :users, :account_id, :integer, :null => false, :default => 0
  	
  end
end
