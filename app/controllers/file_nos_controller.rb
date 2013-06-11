class FileNosController < ApplicationController
  # GET /file_nos
  # GET /file_nos.json
  def index
    @file_nos = FileNo.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @file_nos }
    end
  end

  # GET /file_nos/1
  # GET /file_nos/1.json
  def show
    @file_no = FileNo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @file_no }
    end
  end

  # GET /file_nos/new
  # GET /file_nos/new.json
  def new
    @file_no = FileNo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @file_no }
    end
  end

  # GET /file_nos/1/edit
  def edit
    @file_no = FileNo.find(params[:id])
  end

  # POST /file_nos
  # POST /file_nos.json
  def create
    @file_no = FileNo.new(params[:file_no])

    respond_to do |format|
      if @file_no.save
        format.html { redirect_to @file_no, notice: 'File no was successfully created.' }
        format.json { render json: @file_no, status: :created, location: @file_no }
      else
        format.html { render action: "new" }
        format.json { render json: @file_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /file_nos/1
  # PUT /file_nos/1.json
  def update
    @file_no = FileNo.find(params[:id])

    respond_to do |format|
      if @file_no.update_attributes(params[:file_no])
        format.html { redirect_to @file_no, notice: 'File no was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @file_no.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /file_nos/1
  # DELETE /file_nos/1.json
  def destroy
    @file_no = FileNo.find(params[:id])
    @file_no.destroy

    respond_to do |format|
      format.html { redirect_to file_nos_url }
      format.json { head :no_content }
    end
  end
end
