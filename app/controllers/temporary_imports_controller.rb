class TemporaryImportsController < ApplicationController
  # GET /temporary_imports
  # GET /temporary_imports.json

  def load
    @ti = TemporaryImport.all
    @ti.each do |t|
    	puts t.file_no
    end
  end
  
  def index
    @temporary_imports = TemporaryImport.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @temporary_imports }
    end
  end

  # GET /temporary_imports/1
  # GET /temporary_imports/1.json
  def show
    @temporary_import = TemporaryImport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @temporary_import }
    end
  end

  # GET /temporary_imports/new
  # GET /temporary_imports/new.json
  def new
    @temporary_import = TemporaryImport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @temporary_import }
    end
  end

  # GET /temporary_imports/1/edit
  def edit
    @temporary_import = TemporaryImport.find(params[:id])
  end

  # POST /temporary_imports
  # POST /temporary_imports.json
  def create
    @temporary_import = TemporaryImport.new(params[:temporary_import])

    respond_to do |format|
      if @temporary_import.save
        format.html { redirect_to @temporary_import, :notice => 'Temporary import was successfully created.' }
        format.json { render :json => @temporary_import, :status => :created, :location => @temporary_import }
      else
        format.html { render :action => "new" }
        format.json { render :json => @temporary_import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /temporary_imports/1
  # PUT /temporary_imports/1.json
  def update
    @temporary_import = TemporaryImport.find(params[:id])

    respond_to do |format|
      if @temporary_import.update_attributes(params[:temporary_import])
        format.html { redirect_to @temporary_import, :notice => 'Temporary import was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @temporary_import.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /temporary_imports/1
  # DELETE /temporary_imports/1.json
  def destroy
    @temporary_import = TemporaryImport.find(params[:id])
    @temporary_import.destroy

    respond_to do |format|
      format.html { redirect_to temporary_imports_url }
      format.json { head :no_content }
    end
  end
end
