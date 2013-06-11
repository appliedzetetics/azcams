class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.date :referral_date
      t.string :referred_by
      t.string :status
      t.boolean :closed, :null => false
      t.references :client, :null => false
      
      t.timestamps
    end
    
    add_index :episodes, :client_id
  end
end
