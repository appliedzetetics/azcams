class CreatePractitionerTypes < ActiveRecord::Migration
  def change
    create_table :practitioner_types do |t|
      t.string :description

      t.timestamps
    end
  end
end
