class AddFileNoPerEpisodeToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :file_no_per_episode, :boolean
  end
end
