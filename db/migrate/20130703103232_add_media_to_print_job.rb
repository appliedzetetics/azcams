class AddMediaToPrintJob < ActiveRecord::Migration
  def change
    add_column :print_jobs, :print_media_id, :integer
  end
end
