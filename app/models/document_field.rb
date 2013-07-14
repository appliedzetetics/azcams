class DocumentField < ActiveRecord::Base
  has_and_belongs_to_many :templates
  attr_accessible :documentfield, :railsvariable
end
