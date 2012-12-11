class HookupsController < ApplicationController
    load_and_authorize_resource
  # GET /hookups
  # GET /hookups.json
  
  
  #before_filter :authenticate_person!
  def current_user
    current_person
  end
  
  
    layout :none_for_xhr
  def none_for_xhr
    'application' unless request.xhr?
  end

  def get_about
    #debugger
    @cur = Person.find(params[:id])
    render :inline=>@cur.aboutme
  end
  
  
  def index
    @hookups = Hookup.where( person_a_id: current_person.id)

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

load_and_authorize_resource

  # GET /hookups/new
  # GET /hookups/new.json
  def new
    @hookup = Hookup.new
    ##BAD CODE! Change Later
    @hookup.person_b = Person.where('id != ?', current_person.id).first
    rescue ActiveRecord::MissingAttributeError
    
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
    @hookup.person_a = current_person
    @hookup.url = wtm
    
    respond_to do |format|
      if @hookup.save
        
        PersonMailer.date_email(@hookup.person_a,@hookup,@hookup.person_b).deliver
        PersonMailer.date_email(@hookup.person_b,@hookup,@hookup.person_a).deliver 
        
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
  
  
#Gets a when to meet address
  def wtm
    require 'net/http'
    require 'cgi'
    require 'nokogiri'
    
    time=Time.new
    cd = '0|1|2|'
    for i in 0..7
      cd=cd+time.year.to_s+'-'+time.month.to_s+'-'+(time.day+i).to_s+'|'
    end
    cd = cd+"3|4|5|6"
    params ={
      'NewEventName' => 'Coffee Date',
      'DateTypes'=>'SpecificDates',
      'PossibleDates'=>cd,
      'NoEarlierThan'=>'9',
      'NoLaterThan:'=>'0'
    }
    x = Net::HTTP.post_form(URI.parse('http://www.when2meet.com/SaveNewEvent.php'), params)
    y = x.body
    y = y[38..50]
    
    return "http://www.when2meet.com/"+CGI.escapeHTML(y)
  end

  
end
