class CreateMdays < ActiveRecord::Migration
  def change
    create_table :mdays, :primary_key => :mday do |t|
    end
  	
    (1..31).each do |i|
      Mdays.create :mday => i
    end
  end
end
