class CreatePrintMedia < ActiveRecord::Migration
  def change
    create_table :print_media do |t|
      t.string :description

      t.timestamps
      
    end
    add_index :print_media, :description, { unique: true }
    PrintMedia.create description: "Headed"
    PrintMedia.create description: "Plain"
    
  end
end
