class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
   else
      redirect_to "/home/principal"
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /events/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @event = Event.find(params[:id])
  else
      redirect_to "/home/principal"
    end
  end

  # POST /events
  # POST /events.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @event = Event.new(params[:event])
    @event.user=u
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
  u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
   @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
   else
      redirect_to "/home/principal"
   end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
     
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
    else
      redirect_to "/home/principal"
    end
   end
end
