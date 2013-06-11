class AccountsSettings < ActiveRecord::Migration
  def up
 		create_table :accounts_settings, :id => false do |t|
 			t.integer :account_id, :null => false
 			t.integer :setting_id, :null => false
 			t.string :value
		end  
  	add_index :accounts_settings, :account_id
  	add_index :accounts_settings, :setting_id
  end

  def down
  end
end
