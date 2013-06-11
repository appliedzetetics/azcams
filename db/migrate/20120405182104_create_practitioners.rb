class CreatePractitioners < ActiveRecord::Migration
  def change
    create_table :practitioners do |t|
      t.string :surname
      t.string :forename
      t.string :title
      t.string :honorifics
      t.string :telephone

      t.timestamps
    end
  end
end
