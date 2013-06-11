class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :tag
      t.string :description

      t.timestamps
    end
    add_index :settings, :tag, :unique => true
  end
end
