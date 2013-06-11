class EpisodeContactsController < ApplicationController
  # GET /episode_contacts
  # GET /episode_contacts.json
  def index
    @episode_contacts = EpisodeContact.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @episode_contacts }
    end
  end

  # GET /episode_contacts/1
  # GET /episode_contacts/1.json
  def show
    @episode_contact = EpisodeContact.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @episode_contact }
    end
  end

  # GET /episode_contacts/new
  # GET /episode_contacts/new.json
  def new
    @episode_contact = EpisodeContact.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @episode_contact }
    end
  end

  # GET /episode_contacts/1/edit
  def edit
    @episode_contact = EpisodeContact.find(params[:id])
  end

  # POST /episode_contacts
  # POST /episode_contacts.json
  def create
    @episode_contact = EpisodeContact.new(params[:episode_contact])

    respond_to do |format|
      if @episode_contact.save
        format.html { redirect_to @episode_contact, notice: 'Episode contact was successfully created.' }
        format.json { render json: @episode_contact, status: :created, location: @episode_contact }
      else
        format.html { render action: "new" }
        format.json { render json: @episode_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /episode_contacts/1
  # PUT /episode_contacts/1.json
  def update
    @episode_contact = EpisodeContact.find(params[:id])

    respond_to do |format|
      if @episode_contact.update_attributes(params[:episode_contact])
        format.html { redirect_to @episode_contact, notice: 'Episode contact was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @episode_contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /episode_contacts/1
  # DELETE /episode_contacts/1.json
  def destroy
    @episode_contact = EpisodeContact.find(params[:id])
    @episode_contact.destroy

    respond_to do |format|
      format.html { redirect_to episode_contacts_url }
      format.json { head :no_content }
    end
  end
end
