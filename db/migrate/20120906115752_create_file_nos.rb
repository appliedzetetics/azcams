class CreateFileNos < ActiveRecord::Migration
  def change
    create_table :file_nos do |t|
      t.references :account, :null => false
      t.integer :file_no, :null =>false

      t.timestamps
    end
    add_index :file_nos, :account_id
  end
end
