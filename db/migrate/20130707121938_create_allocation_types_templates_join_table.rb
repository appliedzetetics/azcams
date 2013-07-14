class CreateAllocationTypesTemplatesJoinTable < ActiveRecord::Migration
  def change
    create_table :allocation_types_templates, :id => false do |t|
    	t.integer :allocation_type_id, :null => false
    	t.integer :template_id, :null => false
    end
    add_index :allocation_types_templates, [:allocation_type_id, :template_id], :unique => false, :name => "allocation_types_templates_index"
    	    
   end
 end
