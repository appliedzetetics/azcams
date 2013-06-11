class AddNoteToAbsence < ActiveRecord::Migration
  def change
    add_column :absences, :note, :text
  end
end
