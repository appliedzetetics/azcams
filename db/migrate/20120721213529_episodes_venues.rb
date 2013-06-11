class EpisodesVenues < ActiveRecord::Migration
  def up
  	create_table :episodes_venues, :id => false do |t|
  		t.references :episode, :null => false
  		t.references :venue, :null => false
  	end
  end

  def down
  end
end
