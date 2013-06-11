class ClientsController < ApplicationController
	before_filter :authenticate_user!
  # GET /clients
  # GET /clients.json

  def index
    @c = Client.account(current_user)
    if params.has_key? :list
      cookies[:client_list] = params[:list]
      if params[:list] > ''
        @list = AllocationType.find(params[:list])
        params[:q] = nil
      end
    end

    if params.has_key? :q
      cookies[:query] = params[:q]
    end

    @ordertag = "waiting list order, oldest first"
    if @list && @list.is_assessment?
      @c = @c.on_ia_wl()
    elsif @list && @list.is_treatment?
      @c = @c.on_therapy_wl()
    else
      if cookies[:query]
        params[:q] = cookies[:query]
        @c = @c.where("surname like ?", cookies[:query] + '%')
      end
      @c = @c.order(["surname", "forename"])
      @ordertag = "alphabetical order"
    end

    @clients = @c.group("clients.id").paginate :page => params[:page], :per_page => 16

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @clients }
    end
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
    @client = Client.find(params[:id])
    @episodes = Episode.where(:client_id => @client).order("referral_date DESC")
    Activity.log(request, current_user, @client)
    r=Activity.check(request, current_user, @client)
    unless r.nil?
      flash[:activity] = r.map{|a| a.id }.join('!')
    end

    if (@client.account_id == current_user.account.id + 1)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render :json => @client }
      end
    end
  end

  # GET /clients/new
  # GET /clients/new.json
  def new
    @client = Client.new
    @client.account_id == current_user.account

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @client }
    end
  end

  # GET /clients/1/edit
  def edit
    @client = Client.find(params[:id])
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(params[:client])
    @client.account_id == current_user.account
    respond_to do |format|
      if @client.save
        format.html { redirect_to new_episode_path(:client_id => @client), :notice => 'Client was successfully created.' }
        format.json { render :json => @client, :status => :created, :location => @client }
      else
        format.html { render :action => "new" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /clients/1
  # PUT /clients/1.json
  def update
    @client = Client.find(params[:id])

    respond_to do |format|
      if @client.update_attributes(params[:client])
        format.html { redirect_to @client, :notice => 'Client was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "index" }
        format.json { render :json => @client.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    @client = Client.find(params[:id])
    @client.destroy

    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  def myclients
    @clients = Client.account(current_user).
      joins(:episodes=>:allocations).
      where("allocations.practitioner_id=?", current_user).
      group("clients.id").
      paginate :page => params[:page], :per_page => 16

    respond_to do |format|
      format.html # myclients.html.erb
      format.json { render :json => @clients }
    end

  end
end
