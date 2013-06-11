class TemporaryImport < ActiveRecord::Base
  @rdate = /\d+\/\d+\/\d+/

  
  def self.datefromfield(f)
    @rdate.match(f)
  end
  
  def self.restfromfield(f)
    if datefromfield(f)
      f.gsub(@rdate, '').strip
    end
  end
  
  def self.import
    @ti = TemporaryImport.all
    @ti.each do |t|
    	#
    	# Field processing we need to do.
    	# 1. Split multiple phone numbers
    	# 2. Parse out dates from ia_counsellor, counsellor, and location
    	c = Client.new
    	phones = t.phone.split('/')
	c.telephone_home = phones[0]
	if phones.count > 1
	  c.telephone_mobile = phones[1]
	end
	
	if datefromfield(t.ia_counsellor)
	  d= datefromfield(t.ia_counsellor)
	  r = restfromfield(t.ia_counsellor)
	  
	end
    	
    
    
    end
  end
	
end
