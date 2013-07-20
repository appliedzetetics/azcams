class CreateMediaTypes < ActiveRecord::Migration
  def change
    create_table :media_types do |t|
      t.integer :account_id, :null => false
      t.string :name
      t.timestamps
    end
  end
end
