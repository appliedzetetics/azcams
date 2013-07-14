class CreateTriggerTypes < ActiveRecord::Migration
  def change
    create_table :trigger_types do |t|
      t.string :name
      t.boolean :is_print
      t.boolean :is_script

      t.timestamps
    end
  end
end
