class Template < ActiveRecord::Base
  belongs_to :account
  belongs_to :media_type
  has_and_belongs_to_many :document_fields
  has_and_belongs_to_many :allocation_types 
  
  has_attached_file :template, :path => "templates/:id-:basename.:extension"
  attr_accessible :description, :filename, :name, :template
  
end
