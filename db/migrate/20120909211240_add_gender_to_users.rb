class AddGenderToUsers < ActiveRecord::Migration
  def change
    add_column :users, :male, :boolean, :default => false, :null => false
  end
end
