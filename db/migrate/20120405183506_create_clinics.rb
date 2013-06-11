class CreateClinics < ActiveRecord::Migration
  def change
    create_table :clinics do |t|
      t.references :practitioner
      t.references :venue
      t.date :effective_from
      t.integer :day_of_week

      t.timestamps
    end
    add_index :clinics, :practitioner_id
    add_index :clinics, :venue_id
    add_foreign_key :clinics, :practitioners, :dependent => :delete
    add_foreign_key :clinics, :venues, :dependent => :delete

  end
end
