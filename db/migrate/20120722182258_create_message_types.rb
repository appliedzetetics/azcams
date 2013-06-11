class CreateMessageTypes < ActiveRecord::Migration
  def self.up
    create_table :message_types do |t|
      t.string :description
      t.boolean :is_email, :null => false, :default => false
      t.boolean :is_printable, :null => false, :default => false
      t.boolean :is_phone, :null => false, :default => false

      t.timestamps
    end
    
    MessageType.create :description => 'Email', :is_email => true
    MessageType.create :description => 'Letter', :is_printable => true
    MessageType.create :description => 'Phone call', :is_phone => true
    
  end
  
  def self.down
  	drop_table :message_types
  end
end
