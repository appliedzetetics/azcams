class PrintQueue < ActiveRecord::Base
  belongs_to :user
  belongs_to :print_template
  has_attached_file :pdf
  
  attr_accessible :entity, :entity_id
end
