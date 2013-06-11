#
# A table to record when someone views a client record, etc.
#
#
class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :session_id, :null => false
      t.string :tablename, :null => false
      t.integer :entity_id, :null => false
      t.references :user, :null => false

      t.timestamps
    end
    add_index :activities, :user_id
    add_index :activities, :session_id
    add_index :activities, :tablename
    add_index :activities, :entity_id
    add_index :activities, :created_at
    
  end
end
