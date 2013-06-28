class EpisodesController < ApplicationController
	before_filter :authenticate_user!

	autocomplete :client, :surname

  # GET /episodes
  # GET /episodes.json
  def index
    @episodes = Episode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @episodes }
    end
  end

  # GET /episodes/1
  # GET /episodes/1.json
  def show
    @episode = Episode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @episode }
    end
  end

  # GET /episodes/new
  # GET /episodes/new.json
  def new
    @episode = Episode.new
    @episode.closed = false
    @venues = Venue.all
    
    if params[:client_id]
    	@episode.client_id = params[:client_id]
    	@client = Client.find(@episode.client_id)
    end

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @episode }
    end
  end

  # GET /episodes/1/edit
  def edit
    @episode = Episode.find(params[:id])

  end

  # POST /episodes
  # POST /episodes.json
  def create
#    if @episode[:client] # create the client record
#    end

    @episode = Episode.new(params[:episode])
    @episode.create_file_no(current_user.account)
    @episode.closed.nil? && @episode.closed = false

    respond_to do |format|
      if @episode.save
				if (params[:allocate])
	        format.html { redirect_to new_allocation_path(:episode_id => @episode), :notice => 'Episode was successfully created.' }
		      format.json { render :json => @episode, :status => :created, :location => @episode }
				else
	        format.html { redirect_to Client.find(@episode.client_id), :notice => 'Episode was successfully created.' }
		      format.json { render :json => @episode, :status => :created, :location => @episode }
				end
      else
        format.html { render :action => "new" }
        format.json { render :json => @episode.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /episodes/1
  # PUT /episodes/1.json
  def update
    @episode = Episode.find(params[:id])

    respond_to do |format|
      if @episode.update_attributes(params[:episode])
        format.html { redirect_to Client.find(@episode.client_id), :notice => 'Episode was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @episode.errors, :status => :unprocessable_entity }
      end
    end
  end

  def close
    @episode = Episode.find(params[:id])
    @episode.closed = true

    respond_to do |format|
      @episode.save!
      format.html { redirect_to @episode.client, :notice => 'Episode closed.' }
      format.json { head :no_content }
    end

  end


  # DELETE /episodes/1
  # DELETE /episodes/1.json
  def destroy
    @episode = Episode.find(params[:id])
    @client_id = @episode.client_id
    @episode.destroy

    respond_to do |format|
      format.html { redirect_to Client.find(@client_id) }
      format.json { head :no_content }
    end
  end

end
