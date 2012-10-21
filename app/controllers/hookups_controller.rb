class HookupsController < ApplicationController
  # GET /hookups
  # GET /hookups.json

  def index
    @hookups = Hookup.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hookups }
    end
  end

  # GET /hookups/1
  # GET /hookups/1.json
  def show
    @hookup = Hookup.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hookup }
    end
  end

  # GET /hookups/new
  # GET /hookups/new.json
  def new
    @hookup = Hookup.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hookup }
    end
  end

  # GET /hookups/1/edit
  def edit
    @hookup = Hookup.find(params[:id])
  end

  # POST /hookups
  # POST /hookups.json
  def create
    @hookup = Hookup.new(params[:hookup])

    respond_to do |format|
      if @hookup.save
        format.html { redirect_to @hookup, notice: 'Hookup was successfully created.' }
        format.json { render json: @hookup, status: :created, location: @hookup }
      else
        format.html { render action: "new" }
        format.json { render json: @hookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hookups/1
  # PUT /hookups/1.json
  def update
    @hookup = Hookup.find(params[:id])
    
    respond_to do |format|
      if @hookup.update_attributes(params[:hookup])
        format.html { redirect_to @hookup, notice: 'Hookup was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hookup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hookups/1
  # DELETE /hookups/1.json
  def destroy
    @hookup = Hookup.find(params[:id])
    @hookup.destroy

    respond_to do |format|
      format.html { redirect_to hookups_url }
      format.json { head :no_content }
    end
  end
end
