class AbsenceSlotsController < ApplicationController
  # GET /absence_slots
  # GET /absence_slots.json
  def index
    @absence_slots = AbsenceSlot.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @absence_slots }
    end
  end

  # GET /absence_slots/1
  # GET /absence_slots/1.json
  def show
    @absence_slot = AbsenceSlot.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @absence_slot }
    end
  end

  # GET /absence_slots/new
  # GET /absence_slots/new.json
  def new
    @absence_slot = AbsenceSlot.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @absence_slot }
    end
  end

  # GET /absence_slots/1/edit
  def edit
    @absence_slot = AbsenceSlot.find(params[:id])
  end

  # POST /absence_slots
  # POST /absence_slots.json
  def create
    @absence_slot = AbsenceSlot.new(params[:absence_slot])

    respond_to do |format|
      if @absence_slot.save
        format.html { redirect_to @absence_slot, notice: 'Absence slot was successfully created.' }
        format.json { render json: @absence_slot, status: :created, location: @absence_slot }
      else
        format.html { render action: "new" }
        format.json { render json: @absence_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /absence_slots/1
  # PUT /absence_slots/1.json
  def update
    @absence_slot = AbsenceSlot.find(params[:id])

    respond_to do |format|
      if @absence_slot.update_attributes(params[:absence_slot])
        format.html { redirect_to @absence_slot, notice: 'Absence slot was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @absence_slot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absence_slots/1
  # DELETE /absence_slots/1.json
  def destroy
    @absence_slot = AbsenceSlot.find(params[:id])
    @absence_slot.destroy

    respond_to do |format|
      format.html { redirect_to absence_slots_url }
      format.json { head :no_content }
    end
  end
end
