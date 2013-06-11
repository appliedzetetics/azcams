class CreateAllocationTypes < ActiveRecord::Migration
  def change
    create_table :allocation_types do |t|
      t.string :description
      t.boolean :is_assessment
      t.boolean :is_treatment

      t.timestamps
    end
  end
end
