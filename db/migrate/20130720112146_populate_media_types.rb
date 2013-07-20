class PopulateMediaTypes < ActiveRecord::Migration
  def up
    MediaType.create :name => 'Headed', :account_id => 1
    MediaType.create :name => 'Plain', :account_id => 1
    MediaType.create :name => 'Headed', :account_id => 0
    MediaType.create :name => 'Plain', :account_id => 0
  end

  def down
  end
end
