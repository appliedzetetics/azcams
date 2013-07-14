class RenameMediaTypeInTemplates < ActiveRecord::Migration
  def up
		rename_column :templates, :mediatype_id, :media_type_id  	

  end

  def down
  end
end
