class CreateAbsences < ActiveRecord::Migration
  def change
    create_table :absences do |t|
      t.references :practitioner, :null => false
      t.date :date_from, :null => false
      t.date :date_to, :null => false

      t.timestamps
    end
    add_index :absences, :practitioner_id
    add_index :absences, :date_from
  end
end
