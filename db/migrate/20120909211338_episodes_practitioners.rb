class EpisodesPractitioners < ActiveRecord::Migration
  def up
    	create_table :episodes_practitioners, :id => false do |t|
  		t.references :episode, :null => false
  		t.references :practitioner, :null => false
  	end

  end

  def down
  end
end
