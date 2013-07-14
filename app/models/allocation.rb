# Encoding: ASCII-8BIT
require 'rubygems'
require 'serenity'
require 'open3'

SPOOL_PREFIX="/var/spool/azcams"

class Allocation < ActiveRecord::Base
  belongs_to :episode
  belongs_to :practitioner
  belongs_to :allocation_type
  has_many :appointments

  validates :allocation_type_id, presence: true

  accepts_nested_attributes_for :appointments,
		:reject_if => lambda { |a| ( a[:appointment_date].to_i == 0) }

  include Serenity::Generator

  def lastappointment
    self.appointments.last
  end

  def description
		self.allocation_type.description
  end

	def is_assessment?
		allocation_type.is_assessment
	end

	def is_treatment?
		allocation_type.is_treatment
	end

  def generate_print_jobs(current_user = nil)
		@episode = self.episode
		@client = @episode.client
		
		#
		# Loop through each template we have for this allocation
		# and populate it,
  	self.allocation_type.templates.each do |t|

			# Generate a new random filename for the output file
			basefile="#{SPOOL_PREFIX}/#{$$}-#{rand(0x100000000).to_s(36)}"
      report = ODFReport::Report.new(t.template.path) do |r|
				t.document_fields.each do |f|
					begin
						fv = eval(f.railsvariable).gsub!(/\r\n/, ' ') # embedded CRLFs upset Libreoffice
						r.add_field(f.documentfield, fv)
						logger.info "Set field #{f.documentfield} to value #{fv}"
					rescue
					end
				end # document_fields.each
			end # report
			report.generate("#{basefile}.odt")
			if self.convert_to_pdf(basefile)
				unless current_user.nil? # just makes it all a bit quieter if we're running this from the console.
		      p = PrintJob.create do |p|
	     			p.user = current_user
  	     	  p.content = "Template #{t.name} #{@episode.file_no||@client.file_no}"
    	 	    p.media_type_id = t.media_type_id
   	  	    p.pdf_file = "#{basefile}.pdf"
 	      	  p.printed = false   
 	      	end # p
	      end # current_user.nil?
			end # convert successful
		end # each template
  end
  
	def generate_print_jobs_async(current_user = nil)
		self.delay.generate_print_jobs(current_user)
	end

	def convert_to_pdf(basefile)
    cmd = "/usr/bin/unoconv -f pdf #{basefile}.odt"
    logger.debug "Executing command \'#{cmd}\'"
    output,returncode = Open3.capture2e(cmd)   
    logger.debug "Command output #{output} (returncode #{returncode})"
    returncode
  end
  

end
