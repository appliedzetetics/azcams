class PrintQueue < ActiveRecord::Base
  belongs_to :user
  belongs_to :print_template
  attr_accessible :entity, :entity_id
end
