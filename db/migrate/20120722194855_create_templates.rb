class CreateTemplates < ActiveRecord::Migration
  def self.up
    create_table :templates do |t|
      t.references :account
      t.string :name
      t.string :description
      t.string :filename

      t.timestamps
    end
    add_index :templates, :account_id
  end
  
  def self.down
    drop_table :templates
  end
end
