class CreatePrintJobs < ActiveRecord::Migration
  def change
    create_table :print_jobs do |t|
      t.references :user, :null => false
      t.boolean :private_to_user, :default => false
      t.string :content    # some kind of name for the content, eg "Assessment"
      t.string :reference  # reference number for it - file number, perhaps?
      t.integer :mediatype # 1 = plain, 2 = headed
      t.string :pdf_file
      t.boolean :printed

      t.timestamps
    end
    add_index :print_jobs, :user_id
  end
end
