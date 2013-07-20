require 'rubygems'
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

  def lastappointment
    self.appointments.last
  end

  def description
		unless self.allocation_type.nil?
			self.allocation_type.description
		else
			'N/A'
		end
  end

	def is_assessment?
		allocation_type.is_assessment
	end

	def is_treatment?
		allocation_type.is_treatment
	end

  def processprinttasks(template_ids, current_user = nil)
  	@allocation=self
#		thisallocation=Allocation.find(self) # hopefully reloads
		logger.debug("Processprinttasks called with #{template_ids}")		
		logger.debug("File no #{@allocation.episode.file_no}")
		#
		# Loop through each template we have for this allocation
		# and populate it,
		template_ids.each do |i,v| # we ignore v - it's just the "1" from the checkbox
			if t=self.allocation_type.templates.find(i) # make sure it's actually in our list

        # Generate a new random filename for the output file
        basefile="#{SPOOL_PREFIX}/#{$$}-#{rand(0x100000000).to_s(36)}"
        report = ODFReport::Report.new(t.template.path) do |r|
          t.document_fields.by_base_class(self.class.name).each do |f|
            begin
            	fieldvariable="@allocation.#{f.railsvariable}"
              fv = eval(fieldvariable)
              fv.gsub!(/\n/, '') # embedded LFs upset Libreoffice
#              fv = '' if fv.nil?
              r.add_field(f.documentfield, fv)
              logger.info "Set field #{f.documentfield} from variable #{fieldvariable} to value #{fv}"
            rescue
            end
          end # document_fields.each
        end # report
        report.generate("#{basefile}.odt")
        if self.convert_to_pdf(basefile)
          unless current_user.nil? # just makes it all a bit quieter if we're running this from the console.
            p = PrintJob.create do |p|
            	p.account_id = current_user.account
              p.user = current_user
              p.content = "Template #{t.name} #{self.episode.file_no||self.episode.client.file_no}"
              p.media_type_id = t.media_type_id
              p.pdf_file = "#{basefile}.pdf"
              p.printed = false   
            end # p
          end # current_user.nil?
        end # template found
      end # convert successful
		end # each template
  end
  
	def convert_to_pdf(basefile)
    cmd = "/usr/bin/unoconv -f pdf #{basefile}.odt"
    logger.debug "Executing command \'#{cmd}\'"
    output,returncode = Open3.capture2e(cmd)   
    logger.debug "Command output #{output} (returncode #{returncode})"
    returncode
  end
  

end
