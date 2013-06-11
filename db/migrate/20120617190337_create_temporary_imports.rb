class CreateTemporaryImports < ActiveRecord::Migration
  def change
    create_table :temporary_imports do |t|
      t.string :file_no
      t.string :forename
      t.string :surname
      t.date :dob
      t.string :phone
      t.string :address1
      t.string :address2
      t.string :town
      t.string :postcode
      t.string :referred_by
      t.string :dateref_text
      t.date :referred_date
      t.string :ia_counsellor
      t.string :ia_location
      t.date :ia_date
      t.string :counsellor
      t.string :location
      t.date :counselling_start_date
      t.string :status
      t.string :rogue_address

      t.timestamps
    end
  end
end
