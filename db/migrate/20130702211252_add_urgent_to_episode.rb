class AddUrgentToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :urgent, :boolean, :default => false
  end
end
