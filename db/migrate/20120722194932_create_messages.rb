class CreateMessages < ActiveRecord::Migration
  def self.up
    create_table :messages do |t|
      t.references :episode, :null => false
      t.references :template, :null => false
      t.references :message_type, :null => false
      t.references :user, :null => false
      t.datetime :completed, :null => true

      t.timestamps
    end
    add_index :messages, :episode_id
    add_index :messages, :template_id
    add_index :messages, :message_type_id
    add_index :messages, :user_id
  end
  
  def self.down
    drop_table :message
  end
end
