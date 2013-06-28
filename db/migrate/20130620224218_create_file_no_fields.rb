class CreateFileNoFields < ActiveRecord::Migration
  def change
    create_table :file_no_fields do |t|
      t.string :table
      t.string :column
      t.references :field_type

      t.timestamps
    end
    add_index :file_no_fields, :field_type_id
  end
end
