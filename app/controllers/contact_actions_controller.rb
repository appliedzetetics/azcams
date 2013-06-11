class ContactActionsController < ApplicationController
  # GET /contact_actions
  # GET /contact_actions.json
  def index
    @contact_actions = ContactAction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contact_actions }
    end
  end

  # GET /contact_actions/1
  # GET /contact_actions/1.json
  def show
    @contact_action = ContactAction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contact_action }
    end
  end

  # GET /contact_actions/new
  # GET /contact_actions/new.json
  def new
    @contact_action = ContactAction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contact_action }
    end
  end

  # GET /contact_actions/1/edit
  def edit
    @contact_action = ContactAction.find(params[:id])
  end

  # POST /contact_actions
  # POST /contact_actions.json
  def create
    @contact_action = ContactAction.new(params[:contact_action])

    respond_to do |format|
      if @contact_action.save
        format.html { redirect_to @contact_action, notice: 'Contact action was successfully created.' }
        format.json { render json: @contact_action, status: :created, location: @contact_action }
      else
        format.html { render action: "new" }
        format.json { render json: @contact_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contact_actions/1
  # PUT /contact_actions/1.json
  def update
    @contact_action = ContactAction.find(params[:id])

    respond_to do |format|
      if @contact_action.update_attributes(params[:contact_action])
        format.html { redirect_to @contact_action, notice: 'Contact action was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contact_action.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_actions/1
  # DELETE /contact_actions/1.json
  def destroy
    @contact_action = ContactAction.find(params[:id])
    @contact_action.destroy

    respond_to do |format|
      format.html { redirect_to contact_actions_url }
      format.json { head :no_content }
    end
  end
end
