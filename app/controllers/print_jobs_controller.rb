class PrintJobsController < ApplicationController
  def index
  end

	# link to allow downloading of print jobs. Currently just does everything for the current user , but will need
	# eventually to be able to specify on the basis of media type, etc
  def download
  	outfile = "/var/spool/azcams/#{$$}-#{rand(0x100000000).to_s(36)}.pdf"
		files = current_user.print_jobs.unprinted.pluck(:pdf_file)
		logger.debug "Job files: #{files.join(' ')}"
		
  	# Open the ghostscript command to process the PDF files into one big one
# 	 	stdin, stdout, stderr = Open3.popen3("/usr/bin/gs -dBATCH -dNOPAUSE -dSAFER-q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=- -")
#    current_user.print_jobs.each do |j|
#      # *Apparently*, this opens the file, reads the whole lot, and sends it to the buffer identified by stdin
#      pdf=File.open(j.pdf_file, 'r')
#      f = pdf.read(nil)
#      stdin.write(f)
#      pdf.close
#    end
     `/usr/bin/gs -dBATCH -dNOPAUSE -dSAFER-q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=#{outfile} #{files.join(' ')}`

    send_file(outfile, :filename => "#{current_user.account.name} azCams print task")
		current_user.print_jobs.unprinted.each do |j|
			j.printed = true
			j.save
		end
		File.delete(outfile) if File.exist?(outfile)
		
	  	
  end
end
