class CreatePractitionerTypesPractitioners < ActiveRecord::Migration
  def change
    create_table :practitioner_types_practitioners, :id => false do |t|
      t.integer :practitioner_type_id
      t.integer :practitioner_id
    end
    add_index :practitioner_types_practitioners, :practitioner_type_id
    add_index :practitioner_types_practitioners, :practitioner_id
  end
end
