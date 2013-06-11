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
    @practitioners = Practitioner.account(current_user)
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

    respond_to do |format|
      if @allocation.save
				@episode = @allocation.episode
        @client = @allocation.episode.client
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
    @episode_id = @allocation.episode_id
    @allocation.destroy

    respond_to do |format|
      format.html { redirect_to episode_path(@episode_id) }
      format.json { head :no_content }
    end
  end
end
