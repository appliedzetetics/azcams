class Trigger < ActiveRecord::Base
  belongs_to :allocation_type
  belongs_to :trigger_type
  attr_accessible :object_id
end
