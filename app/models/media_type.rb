class MediaType < ActiveRecord::Base
  has_many :templates
  has_many :print_jobs
  attr_accessible :name
end
