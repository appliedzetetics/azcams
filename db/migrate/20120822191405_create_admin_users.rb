class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string :email
      t.string :surname
      t.string :forename
      t.string :title
      t.boolean :admin

      t.timestamps
    end
  end
end
