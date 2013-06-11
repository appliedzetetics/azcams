class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.references :user
      t.string :url
      t.text :notes

      t.timestamps
    end
    add_index :ideas, :user_id
  end
end
