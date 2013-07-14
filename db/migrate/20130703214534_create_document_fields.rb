class CreateDocumentFields < ActiveRecord::Migration
  def change
    create_table :document_fields do |t|
      t.string :documentfield
      t.string :railsvariable

      t.timestamps
    end
    add_index :document_fields, :documentfield
    add_index :document_fields, :railsvariable

    create_table :document_fields_templates, :id => false do |t|
    	t.references :document_field, :template
    end
    add_index :document_fields_templates, [:document_field_id, :template_id], :unique => false, :name => "document_fields_templates_index"
    	    
  end
end
