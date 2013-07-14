class RenameMediaTypeInPrintJobs < ActiveRecord::Migration
  def up
		rename_column :print_jobs, :mediatype, :media_type_id  	
  end

  def down
  end
end
