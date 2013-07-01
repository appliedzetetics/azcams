class AllocationsController < ApplicationController
	before_filter :authenticate_user!

  # GET /allocations
  # GET /allocations.json
  def index
    @allocations = Allocation.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @allocations }
    end
  end

  # GET /allocations/1
  # GET /allocations/1.json
  def show

		session[:return_to] ||= request.referer
    @allocation = Allocation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @allocation }
    end
  end

  # GET /allocations/new
  # GET /allocations/new.json
  def new
    @allocation = Allocation.new
    @practitioners = Practitioner.account(current_user.account)
    @allocation.episode = Episode.find(params[:episode_id])
    @allocation.allocation_type_id = params[:allocation_type]
    @allocation.appointments.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @allocation }
    end
  end

  # GET /allocations/1/edit
  def edit
		session[:return_to] ||= request.referer
    @allocation = Allocation.find(params[:id])
  end

  # POST /allocations
  # POST /allocations.json
  def create
    @allocation = Allocation.new(params[:allocation])
    @allocation.appointment_count = @allocation.allocation_type.default_appointment_count
#    @practitioners = Practitioner.find :all
#		if (@allocation.appointment.appointment_date == '')
#			@allocation.appointment = nil
#		end

		# Create the spool directory if it doesn't exist
		
		Dir.mkdir('./spool') unless File.directory?("./spool")
    respond_to do |format|
      if @allocation.save
				@episode = @allocation.episode
        @client = @allocation.episode.client

        report = ODFReport::Report.new("./template/Assessment.odt") do |r|
          r.add_field(:file_no,         @episode.file_no)
          r.add_field(:assessment_by,		@episode.allocations.last.practitioner.initials)
          r.add_field(:client_name,			@episode.client.fullname)
          r.add_field(:client_address,	@episode.client.address)
          r.add_field(:postcode,				@episode.client.postcode)
          r.add_field(:home_phone,			@episode.client.telephone_home)
          r.add_field(:mobile_phone,		@episode.client.telephone_mobile)
          r.add_field(:referral_date_dd,@episode.referral_date.mday)
          
          r.add_field(:referral_date_mm,   @episode.referral_date.month)
          r.add_field(:referral_date_yy,   @episode.referral_date.year)
          r.add_field(:referred_by,			@episode.referred_by)
          r.add_field(:email,						@episode.client.email)
          
          	  
        end
				tmpfile="#{$$}-#{rand(0x100000000).to_s(36)}"
				#
				# AnomalyCheck - the reason the odt file does not have spool prefixed is because we have to chdir to
				# the spool directory when we run the libreoffice convert in order for the PDF to end up in the right place
			
				odtfile="#{tmpfile}.odt"
				pdffile="./spool/#{tmpfile}.pdf"
        filename = report.generate("./spool/#{odtfile}")
        if system("cd spool && /usr/bin/libreoffice --headless --invisible --convert-to pdf #{odtfile} && rm -f #{odtfile}")
          p = PrintJob.create do |p|
            p.user = current_user
            p.content = "Assessment #{@episode.file_no}"
            p.mediatype = 1
            p.pdf_file = pdffile
            p.printed = false
          end
				end        
        
        
        notice = "Client successfully allocated to #{@allocation.practitioner.fullname}"
        if (params[:bookappointment])
          format.html { redirect_to new_appointment_path(:allocation_id_new => @allocation), :notice => notice }
        else
          format.html { redirect_to Client.find(@allocation.episode.client_id), :notice => notice }
        end
        format.json { render :json => @allocation, :status => :created, :location => @allocation }
      else
        format.html { render :action => "new" }
        format.json { render :json => @allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /allocations/1
  # PUT /allocations/1.json
  def update
    @allocation = Allocation.find(params[:id])

    respond_to do |format|
      if @allocation.update_attributes(params[:allocation])
        format.html { redirect_to session[:return_to], :notice => 'Allocation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @allocation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /allocations/1
  # DELETE /allocations/1.json
  def destroy
    @allocation = Allocation.find(params[:id])
    @episode = @allocation.episode
    @allocation.destroy

    respond_to do |format|
      format.html { redirect_to client_path(@episode.client) }
      format.json { head :no_content }
    end
  end
end
