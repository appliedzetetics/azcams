class PrintTemplatesController < ApplicationController
  # GET /print_templates
  # GET /print_templates.json
  def index
    @print_templates = PrintTemplate.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @print_templates }
    end
  end

  # GET /print_templates/1
  # GET /print_templates/1.json
  def show
    @print_template = PrintTemplate.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @print_template }
    end
  end

  # GET /print_templates/new
  # GET /print_templates/new.json
  def new
    @print_template = PrintTemplate.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @print_template }
    end
  end

  # GET /print_templates/1/edit
  def edit
    @print_template = PrintTemplate.find(params[:id])
  end

  # POST /print_templates
  # POST /print_templates.json
  def create
    @print_template = PrintTemplate.new(params[:print_template])

    respond_to do |format|
      if @print_template.save
        format.html { redirect_to @print_template, notice: 'Print template was successfully created.' }
        format.json { render json: @print_template, status: :created, location: @print_template }
      else
        format.html { render action: "new" }
        format.json { render json: @print_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /print_templates/1
  # PUT /print_templates/1.json
  def update
    @print_template = PrintTemplate.find(params[:id])

    respond_to do |format|
      if @print_template.update_attributes(params[:print_template])
        format.html { redirect_to @print_template, notice: 'Print template was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @print_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_templates/1
  # DELETE /print_templates/1.json
  def destroy
    @print_template = PrintTemplate.find(params[:id])
    @print_template.destroy

    respond_to do |format|
      format.html { redirect_to print_templates_url }
      format.json { head :no_content }
    end
  end
end
