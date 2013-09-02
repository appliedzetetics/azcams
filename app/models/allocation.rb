require 'rubygems'
require 'open3'

class Allocation < ActiveRecord::Base
  belongs_to :episode
  belongs_to :practitioner
  belongs_to :allocation_type
  has_many :appointments

  validates :allocation_type_id, presence: true

  accepts_nested_attributes_for :appointments,
		:reject_if => lambda { |a| ( a[:appointment_date].to_i == 0) }

  def lastappointment
    self.appointments.try(:last)
  end

  def description
		self.allocation_type.try(:description)
  end

	def defaultappointmentcount
		self.allocation_type.try(:default_appointment_count)
	end	
	
	def appointmentstatus
		status = ""
		unless lastappointment.nil?
			#
			# Look at the status of the LAST appointment for this referral (activities in progress should
			# have a future appointment)
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

				#
				# We let ODFReport generate a random filename for the (temporary) report file.
				# It gets converted to a PDF in our spool file directory, in any case.			
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

				#
				# Generate the output file from the template and fields
				#
        reportfile = report.generate
        logger.debug "Report generated in #{reportfile}"
        
        #
        # Create a unique PDF name in the spool directory, then convert the .odt file
        # to the PDF one.
        #
				pdfname="#{SPOOL_PREFIX}/#{$$}-#{rand(0x100000000).to_s(36)}.pdf"
        if self.convert_to_pdf(reportfile, pdfname)
        
        	#
        	# Update the print_jobs table with details of the new file. The conditional here is so that,
        	#	when we're running it from the command line (for testing), the absence of a current_user
        	# won't make it bleat - it does mean, though, that the job will not get entered into the print_jobs
        	# table.
        	#
          unless current_user.nil? # just makes it all a bit quieter if we're running this from the console.
            p = PrintJob.create do |p|
            	p.account_id = current_user.account
              p.user = current_user
              p.content = "Template #{t.name} #{self.episode.file_no||self.episode.client.file_no}"
              p.media_type_id = t.media_type_id
              p.pdf_file = pdfname
              p.printed = false   
            end # p
          end # current_user.nil?
        end # template found
      end # convert successful
		end # each template
  end
  

	#
	# Converts the file in reportfile into a PDF named in pdfname. We don't bother deleting the reportfile,
	# as we have a cron job which runs through doing just that every day.
	#
	def convert_to_pdf(reportfile, pdfname)

    cmd = "/usr/bin/unoconv -no #{pdfname} -f pdf #{reportfile}"
    logger.debug "Executing command \'#{cmd}\'"
    output,returncode = Open3.capture2e(cmd)   
    logger.debug "Command output #{output} (returncode #{returncode})"
		returncode
  end
  

end
