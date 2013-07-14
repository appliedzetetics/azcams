class PractitionerType < ActiveRecord::Base
  has_and_belongs_to_many :practitioners, { :join_table => "practitioner_types_users", :foreign_key => "practitioner_type_id" }
#  has_many :practitioners, :through => :practitioner_types_users
  has_and_belongs_to_many :users
end
