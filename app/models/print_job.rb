class PrintJob < ActiveRecord::Base
  belongs_to :user
  belongs_to :media_type
  attr_accessible :media_type, :pdf_file, :printed, :private_to_user
  
  scope :unprinted, where(:printed => false)
	
	def self.by_media_type(m)
		where(:media_type_id => m)
	end  
  
  
end
