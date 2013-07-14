class TriggerTypesController < ApplicationController
  # GET /trigger_types
  # GET /trigger_types.json
  def index
    @trigger_types = TriggerType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trigger_types }
    end
  end

  # GET /trigger_types/1
  # GET /trigger_types/1.json
  def show
    @trigger_type = TriggerType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trigger_type }
    end
  end

  # GET /trigger_types/new
  # GET /trigger_types/new.json
  def new
    @trigger_type = TriggerType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trigger_type }
    end
  end

  # GET /trigger_types/1/edit
  def edit
    @trigger_type = TriggerType.find(params[:id])
  end

  # POST /trigger_types
  # POST /trigger_types.json
  def create
    @trigger_type = TriggerType.new(params[:trigger_type])

    respond_to do |format|
      if @trigger_type.save
        format.html { redirect_to @trigger_type, notice: 'Trigger type was successfully created.' }
        format.json { render json: @trigger_type, status: :created, location: @trigger_type }
      else
        format.html { render action: "new" }
        format.json { render json: @trigger_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trigger_types/1
  # PUT /trigger_types/1.json
  def update
    @trigger_type = TriggerType.find(params[:id])

    respond_to do |format|
      if @trigger_type.update_attributes(params[:trigger_type])
        format.html { redirect_to @trigger_type, notice: 'Trigger type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trigger_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trigger_types/1
  # DELETE /trigger_types/1.json
  def destroy
    @trigger_type = TriggerType.find(params[:id])
    @trigger_type.destroy

    respond_to do |format|
      format.html { redirect_to trigger_types_url }
      format.json { head :no_content }
    end
  end
end
