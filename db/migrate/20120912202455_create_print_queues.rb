class CreatePrintQueues < ActiveRecord::Migration
  def change
    create_table :print_queues do |t|
      t.references :user, :null => false
      t.string :medium, :null => false
      t.string :entity, :null => false
      t.integer :entity_id, :null => false
      t.references :print_template, :null => false

      t.timestamps
    end
    add_index :print_queues, :user_id
    add_index :print_queues, :print_template_id
  end
end
