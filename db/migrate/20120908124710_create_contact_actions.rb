class CreateContactActions < ActiveRecord::Migration
  def change
    create_table :contact_actions do |t|
      t.string :description

      t.timestamps
    end
  end
end
