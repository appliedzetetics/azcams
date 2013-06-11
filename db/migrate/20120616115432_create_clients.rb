class CreateClients < ActiveRecord::Migration
  def up
    create_table :clients do |t|
      t.string :file_no
      t.string :surname
      t.string :forename
      t.date :dob
      t.string :address
      t.string :postcode
      t.string :telephone
      t.string :email

      t.timestamps
    end
    add_index :clients, :file_no, :unique => true
  end
end
