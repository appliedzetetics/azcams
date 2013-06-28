class AppointmentStatusesController < ApplicationController

  # GET /appointment_statuses
  # GET /appointment_statuses.json
  def index
    @appointment_statuses = AppointmentStatus.account(current_user.account)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @appointment_statuses }
    end
  end

  # GET /appointment_statuses/1
  # GET /appointment_statuses/1.json
  def show
    @appointment_status = AppointmentStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @appointment_status }
    end
  end

  # GET /appointment_statuses/new
  # GET /appointment_statuses/new.json
  def new
    @appointment_status = AppointmentStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @appointment_status }
    end
  end

  # GET /appointment_statuses/1/edit
  def edit
    @appointment_status = AppointmentStatus.find(params[:id])
  end

  # POST /appointment_statuses
  # POST /appointment_statuses.json
  def create
    @appointment_status = AppointmentStatus.new(params[:appointment_status])

    respond_to do |format|
      if @appointment_status.save
        format.html { redirect_to @appointment_status, notice: 'Appointment status was successfully created.' }
        format.json { render json: @appointment_status, status: :created, location: @appointment_status }
      else
        format.html { render action: "new" }
        format.json { render json: @appointment_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /appointment_statuses/1
  # PUT /appointment_statuses/1.json
  def update
    @appointment_status = AppointmentStatus.find(params[:id])

    respond_to do |format|
      if @appointment_status.update_attributes(params[:appointment_status])
        format.html { redirect_to @appointment_status, notice: 'Appointment status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @appointment_status.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /appointment_statuses/1
  # DELETE /appointment_statuses/1.json
  def destroy
    @appointment_status = AppointmentStatus.find(params[:id])
    @appointment_status.destroy

    respond_to do |format|
      format.html { redirect_to appointment_statuses_url }
      format.json { head :no_content }
    end
  end
end
