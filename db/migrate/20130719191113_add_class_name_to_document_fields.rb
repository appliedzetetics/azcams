class AddClassNameToDocumentFields < ActiveRecord::Migration
  def change
  	add_column :document_fields, :class_name, :string
  	add_index :document_fields, :class_name
  end
end
