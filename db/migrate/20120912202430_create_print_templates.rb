class CreatePrintTemplates < ActiveRecord::Migration
  def change
    create_table :print_templates do |t|
      t.references :account
      t.string :description
      t.text :content

      t.timestamps
    end
    add_index :print_templates, :account_id
  end
end
