class CreateEpisodeStatuses < ActiveRecord::Migration
  def change
    create_table :episode_statuses do |t|
      t.string :episodestatus, :null => false

      t.timestamps
    end
  end
end
