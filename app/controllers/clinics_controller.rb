class ClinicsController < ApplicationController
 	before_filter :authenticate_user!

  # GET /clinics
  # GET /clinics.json
  def index
    @clinics = Clinic.account(current_user.account).paginate :page => params[:page], :per_page => 16

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clinics }
    end
  end

  # GET /clinics/1
  # GET /clinics/1.json
  def show
    @clinic = Clinic.find(params[:id])
    @slots = @clinic.slots

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @clinic }
    end
  end

  # GET /clinics/new
  # GET /clinics/new.json
  def new
    @clinic = Clinic.new
    5.times do
      @clinic.slots.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @clinic }
    end
  end

  # GET /clinics/1/edit
  def edit
    @clinic = Clinic.find(params[:id])
    (5 - @clinic.slots.count).times do
      @clinic.slots.build
    end
  end

  # POST /clinics
  # POST /clinics.json
  def create
    @clinic = Clinic.new(params[:clinic])

    respond_to do |format|
      if @clinic.save
        format.html { redirect_to @clinic, :notice => 'Clinic was successfully created.' }
        format.json { render :json => @clinic, :status => :created, :location => @clinic }
      else
        format.html { render :action => "new" }
        format.json { render :json => @clinic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clinics/1
  # PUT /clinics/1.json
  def update
    @clinic = Clinic.find(params[:id])
#    @clinic.slots.each do |s|


    respond_to do |format|
      if @clinic.update_attributes(params[:clinic])
        format.html { redirect_to @clinic, :notice => 'Clinic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @clinic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clinics/1
  # DELETE /clinics/1.json
  def destroy
    @clinic = Clinic.find(params[:id])
    @clinic.destroy

    respond_to do |format|
      format.html { redirect_to clinics_url }
      format.json { head :no_content }
    end
  end
end
