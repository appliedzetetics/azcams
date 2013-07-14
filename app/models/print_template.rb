class PrintTemplate < ActiveRecord::Base
  belongs_to :account
  has_many :print_queues
  has_attached_file :template, :styles => {}
  attr_accessible :content, :description
end
