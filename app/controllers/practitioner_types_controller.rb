class PractitionerTypesController < ApplicationController
 	before_filter :authenticate_user!
# GET /practitioner_types
  # GET /practitioner_types.json
  def index
    @practitioner_types = PractitionerType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @practitioner_types }
    end
  end

  # GET /practitioner_types/1
  # GET /practitioner_types/1.json
  def show
    @practitioner_type = PractitionerType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @practitioner_type }
    end
  end

  # GET /practitioner_types/new
  # GET /practitioner_types/new.json
  def new
    @practitioner_type = PractitionerType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @practitioner_type }
    end
  end

  # GET /practitioner_types/1/edit
  def edit
    @practitioner_type = PractitionerType.find(params[:id])
  end

  # POST /practitioner_types
  # POST /practitioner_types.json
  def create
    @practitioner_type = PractitionerType.new(params[:practitioner_type])

    respond_to do |format|
      if @practitioner_type.save
        format.html { redirect_to @practitioner_type, :notice => 'Practitioner type was successfully created.' }
        format.json { render :json => @practitioner_type, :status => :created, :location => @practitioner_type }
      else
        format.html { render :action => "new" }
        format.json { render :json => @practitioner_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /practitioner_types/1
  # PUT /practitioner_types/1.json
  def update
    @practitioner_type = PractitionerType.find(params[:id])

    respond_to do |format|
      if @practitioner_type.update_attributes(params[:practitioner_type])
        format.html { redirect_to @practitioner_type, :notice => 'Practitioner type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @practitioner_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /practitioner_types/1
  # DELETE /practitioner_types/1.json
  def destroy
    @practitioner_type = PractitionerType.find(params[:id])
    @practitioner_type.destroy

    respond_to do |format|
      format.html { redirect_to practitioner_types_url }
      format.json { head :no_content }
    end
  end
end
