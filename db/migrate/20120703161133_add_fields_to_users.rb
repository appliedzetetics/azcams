class AddFieldsToUsers < ActiveRecord::Migration
  def change
  	change_table :users do |f|
  	  f.string :loginid, :null => false
  		f.string :surname, :null => false
  		f.string :forename, :null => false
  		f.string :title
	end  		
  end
end
