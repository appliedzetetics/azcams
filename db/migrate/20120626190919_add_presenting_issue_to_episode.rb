class AddPresentingIssueToEpisode < ActiveRecord::Migration
  def change
    add_column :episodes, :presenting_issue, :text

  end
end
