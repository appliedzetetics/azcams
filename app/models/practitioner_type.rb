class PractitionerType < ActiveRecord::Base
#  has_many :practitioners, :through => :practitioner_types_practitioners
  has_and_belongs_to_many :users
end
