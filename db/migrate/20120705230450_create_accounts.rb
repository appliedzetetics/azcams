class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :name
      t.references :user
      t.string :logo
      t.string :bgcolor

      t.timestamps
    end
    add_index :accounts, :user_id
  end
end
