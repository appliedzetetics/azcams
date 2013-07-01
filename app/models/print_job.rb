class PrintJob < ActiveRecord::Base
  belongs_to :user
  attr_accessible :mediatype, :pdf_file, :printed, :private_to_user
  
  scope :unprinted, where(:printed => false)
  
  
  
end
