class AddAccountToPrintJobs < ActiveRecord::Migration
  def change
    add_column :print_jobs, :account_id, :integer, null: false
    add_index :print_jobs, :account_id
  end
end
