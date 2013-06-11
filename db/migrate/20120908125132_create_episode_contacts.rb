class CreateEpisodeContacts < ActiveRecord::Migration
  def change
    create_table :episode_contacts do |t|
      t.datetime :contacted, :null => false
      t.references :episode, :null => false
      t.boolean :from_client, :null => false
      t.references :contact_type, :null => false
      t.references :contact_action
      t.references :user
      t.text :notes

      t.timestamps
    end
    add_index :episode_contacts, :episode_id
    add_index :episode_contacts, :contact_type_id
    add_index :episode_contacts, :contact_action_id
    add_index :episode_contacts, :user_id
    
    add_foreign_key(:episode_contacts, :episodes, dependent: :delete)
    add_foreign_key(:episode_contacts, :contact_types)
    add_foreign_key(:episode_contacts, :contact_actions)
    add_foreign_key(:episode_contacts, :users)
    

  end
end
