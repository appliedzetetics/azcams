class PrintTemplate < ActiveRecord::Base
  belongs_to :account
  has_many :print_queues
  attr_accessible :content, :description
end
