class PrintQueuesController < ApplicationController
  # GET /print_queues
  # GET /print_queues.json
  def index
    @print_queues = PrintQueue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @print_queues }
    end
  end

  # GET /print_queues/1
  # GET /print_queues/1.json
  def show
    @print_queue = PrintQueue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @print_queue }
    end
  end

  # GET /print_queues/new
  # GET /print_queues/new.json
  def new
    @print_queue = PrintQueue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @print_queue }
    end
  end

  # GET /print_queues/1/edit
  def edit
    @print_queue = PrintQueue.find(params[:id])
  end

  # POST /print_queues
  # POST /print_queues.json
  def create
    @print_queue = PrintQueue.new(params[:print_queue])

    respond_to do |format|
      if @print_queue.save
        format.html { redirect_to @print_queue, notice: 'Print queue was successfully created.' }
        format.json { render json: @print_queue, status: :created, location: @print_queue }
      else
        format.html { render action: "new" }
        format.json { render json: @print_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /print_queues/1
  # PUT /print_queues/1.json
  def update
    @print_queue = PrintQueue.find(params[:id])

    respond_to do |format|
      if @print_queue.update_attributes(params[:print_queue])
        format.html { redirect_to @print_queue, notice: 'Print queue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @print_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /print_queues/1
  # DELETE /print_queues/1.json
  def destroy
    @print_queue = PrintQueue.find(params[:id])
    @print_queue.destroy

    respond_to do |format|
      format.html { redirect_to print_queues_url }
      format.json { head :no_content }
    end
  end
end
