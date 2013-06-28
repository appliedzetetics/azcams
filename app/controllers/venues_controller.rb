class VenuesController < ApplicationController
 	before_filter :authenticate_user!

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.account(current_user.account).paginate :page => params[:page], :per_page => 16

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @venues }
    end
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @venue = Venue.find(params[:id])
    if (@venue.account_id == current_user.account.id)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @venue }
      end
    end
  end

  # GET /venues/new
  # GET /venues/new.json
  def new
    @venue = Venue.new
    @venue.account_id == current_user.account

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @venue }
    end
  end

  # GET /venues/1/edit
  def edit
    @venue = Venue.find(params[:id])
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(params[:venue])
    @venue.account_id = current_user.account

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, :notice => 'Venue was successfully created.' }
        format.json { render :json => @venue, :status => :created, :location => @venue }
      else
        format.html { render :action => "new" }
        format.json { render :json => @venue.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /venues/1
  # PUT /venues/1.json
  def update
    @venue = Venue.find(params[:id])

    respond_to do |format|
      if @venue.account_id == current_user.account.id
        if @venue.update_attributes(params[:venue])
          format.html { redirect_to @venue, :notice => "Venue was successfully updated."}
          format.json { head :no_content }
        else
          format.html { render :action => "edit" }
          format.json { render :json => @venue.errors, :status => :unprocessable_entity }
        end
      else
        format.html { redirect_to @venue, :alert => "Internal security violation: venue/owner accounts differ (#{@venue.account_id}/#{current_user.account.id})" }
        format.json { head :no_content }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue = Venue.find(params[:id])
    if @venue.account_id == current_user.account.id
      @venue.destroy

      respond_to do |format|
        format.html { redirect_to venues_url }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to venues_url, :alert => "Internal security violation: venue/owner accounts differ (#{@venue.account_id}/#{current_user.account.id})" }
        format.json { head :no_content }
      end
    end
  end
end
