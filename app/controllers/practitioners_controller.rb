class PractitionersController < ApplicationController
  # GET /practitioners
  # GET /practitioners.json
  def index
    @practitioners = Practitioner.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @practitioners }
    end
  end

  # GET /practitioners/1
  # GET /practitioners/1.json
  def show
    @practitioner = Practitioner.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @practitioner }
    end
  end

  # GET /practitioners/new
  # GET /practitioners/new.json
  def new
    @practitioner = Practitioner.new
    for day in 0..4 do
      clinic = @practitioner.clinics.build
      clinic.day_of_week = day
      5.times { clinic.slots.build }
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @practitioner }
    end
  end

  # GET /practitioners/1/edit
  def edit
    @practitioner = Practitioner.find(params[:id])
  end

  # POST /practitioners
  # POST /practitioners.json
  def create
    @practitioner = Practitioner.new(params[:practitioner])

    respond_to do |format|
      if @practitioner.save
        format.html { redirect_to @practitioner, :notice => 'Practitioner was successfully created.' }
        format.json { render :json => @practitioner, :status => :created, :location => @practitioner }
      else
        format.html { render :action => "new" }
        format.json { render :json => @practitioner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /practitioners/1
  # PUT /practitioners/1.json
  def update
    @practitioner = Practitioner.find(params[:id])

    respond_to do |format|
      if @practitioner.update_attributes(params[:practitioner])
        format.html { redirect_to @practitioner, :notice => 'Practitioner was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @practitioner.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /practitioners/1
  # DELETE /practitioners/1.json
  def destroy
    @practitioner = Practitioner.find(params[:id])
    @practitioner.destroy

    respond_to do |format|
      format.html { redirect_to practitioners_url }
      format.json { head :no_content }
    end
  end
end
