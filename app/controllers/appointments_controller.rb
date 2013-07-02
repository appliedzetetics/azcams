class AppointmentsController < ApplicationController
	before_filter :authenticate_user!

  # GET /appointments
  # GET /appointments.json
  def index
    @appointments = Appointment.account(current_user.account).order("appointment_date, appointment_time DESC").paginate :page => params[:page], :per_page => 16

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @appointments }
    end
  end

  def calendar
    @practitioner = Practitioner.find(current_user)
    @appointments = Appointment.all
    @date = params.has_key?(:date) ? Date.strptime(params[:date]) : Date.today

    respond_to do |format|
      format.html { render :calendar }
      format.json { render :json => @appointments }
    end
  end

  # an action to allow an anticipated appointment to be booked directly from the calendar
  # screen
  def book
		@appointment = Appointment.new
		@appointment.allocation = Allocation.find(params[:allocation_id]) if (params[:allocation_id])
		@appointment.appointment_date = params[:appointment_date] if (params[:appointment_date])
		@appointment.appointment_time = params[:appointment_time] if (params[:appointment_time])
    @appointment.slot_id = params[:slot_id] if (params[:slot_id])
    @appointment.counted = true
    @appointment.save!

		respond_to do |format|
			format.js
		end

  end
  # GET /appointments/1
  # GET /appointments/1.json
  def show
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @appointment }
    end
  end

  # GET /appointments/new
  # GET /appointments/new.json
  def new
    @appointment = Appointment.new
    #
    # We get the allocation ID in as a parameter (in :allocation_id_new), from which
    # we can derive the appointment type, the practitioner, client, preferred venue, etc.
    #
    if params[:notification]
      flash[:activity] = NOTIFICATIONTYPE[params[:notification]]
    end
    @allocation = Allocation.find(params[:allocation_id]) if (params[:allocation_id])

    practitioners = []
    venues = []
    # any practitioners selected in params?
    if @allocation.nil? # not already allocated, so we have a free choice of practitioners
      practitioners=params[:practitioner]
    else
      practitioners = [@allocation.practitioner] if @allocation.practitioner
    end

    venues = params[:venue]

    @appointments = Appointment.find_appointment_slots(@allocation, practitioners, venues)

		@appointment.allocation = @allocation

		params[:appointment_date] && @appointment.appointment_date = params[:appointment_date]
		params[:appointment_time] && @appointment.appointment_time = params[:appointment_time]
    params[:slot_id] && @appointment.slot_id = params[:slot_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @appointment }
      format.js
    end
  end

  # GET /appointments/1/edit
  def edit
#    session[:return_to] ||= request.referer

    @appointment = Appointment.find(params[:id])
  end

  def rebook

  end

  # POST /appointments
  # POST /appointments.json
  def create
    @appointment = Appointment.new(params[:appointment])

#    @appointment.slot = Slot.find(params[:slot])
#    @appointment.appointment_date = params[:appointment_date]
#    @appointment.appointment_time = @appointment.slot.start_time
    @appointment.counted = true

    respond_to do |format|
      if @appointment.save
				format.js
        format.html { redirect_to @appointment.allocation.episode.client, :notice => 'Appointment was successfully created.' }
        format.json { render :json => @appointment, :status => :created, :location => @appointment }
#       format.js { redirect_to "Appointment#calendar"}
      else
        format.js
        format.html { render :action => "new" }
        format.json { render :json => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /appointments/1
  # PUT /appointments/1.json
  def update
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      if @appointment.update_attributes(params[:appointment])
        format.html { redirect_to @appointment.allocation.episode.client, :notice => 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @appointment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /appointments/1
  # DELETE /appointments/1.json
  def destroy
    @appointment = Appointment.find(params[:id])
    @episode = @appointment.allocation.episode
    @appointment.destroy

    respond_to do |format|
      format.html { redirect_to @appointment.allocation.episode.client, :notice => 'Appointment was successfully deleted.' }
      format.json { head :no_content }
    end
  end
end
