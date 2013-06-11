class AddUserIdToPractitioner < ActiveRecord::Migration
  def change
    add_column( :practitioners, :user_id, :integer, :null => false )
    remove_column :practitioners, [:surname, :forename, :title, :honorifics]
  end
end
