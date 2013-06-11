class EpisodeStatusesController < ApplicationController
 	before_filter :authenticate_user!

  # GET /episode_statuses
  # GET /episode_statuses.json
  def index
    @episode_statuses = EpisodeStatus.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @episode_statuses }
    end
  end

  # GET /episode_statuses/1
  # GET /episode_statuses/1.json
  def show
    @episode_status = EpisodeStatus.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @episode_status }
    end
  end

  # GET /episode_statuses/new
  # GET /episode_statuses/new.json
  def new
    @episode_status = EpisodeStatus.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @episode_status }
    end
  end

  # GET /episode_statuses/1/edit
  def edit
    @episode_status = EpisodeStatus.find(params[:id])
  end

  # POST /episode_statuses
  # POST /episode_statuses.json
  def create
    @episode_status = EpisodeStatus.new(params[:episode_status])

    respond_to do |format|
      if @episode_status.save
        format.html { redirect_to @episode_status, :notice => 'Episode status was successfully created.' }
        format.json { render :json => @episode_status, :status => :created, :location => @episode_status }
      else
        format.html { render :action => "new" }
        format.json { render :json => @episode_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /episode_statuses/1
  # PUT /episode_statuses/1.json
  def update
    @episode_status = EpisodeStatus.find(params[:id])

    respond_to do |format|
      if @episode_status.update_attributes(params[:episode_status])
        format.html { redirect_to @episode_status, :notice => 'Episode status was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @episode_status.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /episode_statuses/1
  # DELETE /episode_statuses/1.json
  def destroy
    @episode_status = EpisodeStatus.find(params[:id])
    @episode_status.destroy

    respond_to do |format|
      format.html { redirect_to episode_statuses_url }
      format.json { head :no_content }
    end
  end
end
