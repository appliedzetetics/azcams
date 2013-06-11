class AddFileNoToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :file_no, :string
    add_index :episodes, :file_no, :unique => true
  end
  
end
