class CreatePractitionerTypesUsers < ActiveRecord::Migration
  def up
    create_table :practitioner_types_users, :id => false do |t|
      t.integer :practitioner_type_id, :null => false
      t.integer :user_id, :null => false
    end
    add_index :practitioner_types_users, :practitioner_type_id
    add_index :practitioner_types_users, :user_id
  end
  
  def down
  end
end
