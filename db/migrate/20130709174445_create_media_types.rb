class CreateMediaTypes < ActiveRecord::Migration
  def change
    create_table :media_types do |t|
      t.integer :account_id, :null => false
      t.string :name

      t.timestamps
    end
    MediaTypes.create(:name => 'Headed', :account_id => 1)
    MediaTypes.create(:name => 'Plain', :account_id => 1)
    MediaTypes.create(:name => 'Headed', :account_id => 0)
    MediaTypes.create(:name => 'Plain', :account_id => 0)
  end
end
