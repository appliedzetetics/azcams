class Updateclinicsforeignkeys < ActiveRecord::Migration
  def up
    change_table :clinics do |t|
      remove_foreign_key :clinics, :practitioners
      add_foreign_key :clinics, :users, :column => 'practitioner_id', :dependent => :delete
    end
  end

  def down
  end
end
