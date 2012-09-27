class EgressEventsController < ApplicationController
  # GET /egress_events
  # GET /egress_events.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_events = EgressEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @egress_events }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /egress_events/1
  # GET /egress_events/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_event = EgressEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @egress_event }
    end
   else
      redirect_to "/home/principal"
   end
  end

  # GET /egress_events/new
  # GET /egress_events/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_event = EgressEvent.new
    @egress = Egress.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egress_event }
      format.json { render json: @egress}
    end
    else
      redirect_to "/home/principal"
   end
  end

  # GET /egress_events/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_event = EgressEvent.find(params[:id])
  else
      redirect_to "/home/principal"
   end
  end

  # POST /egress_events
  # POST /egress_events.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_event = EgressEvent.new(params[:egress_event])
    e=Egress.find(params[:egress])
    @egress_event.event = (Event.where(:id => params[:event_id])).first
    @egress_event.egress=e

    respond_to do |format|
      if @egress_event.save
        format.html { redirect_to @egress_event, notice: 'Egress event was successfully created.' }
        format.json { render json: @egress_event, status: :created, location: @egress_event }
      else
        format.html { render action: "new" }
        format.json { render json: @egress_event.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # PUT /egress_events/1
  # PUT /egress_events/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_event = EgressEvent.find(params[:id])

    respond_to do |format|
      if @egress_event.update_attributes(params[:egress_event])
        format.html { redirect_to @egress_event, notice: 'Egress event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @egress_event.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # DELETE /egress_events/1
  # DELETE /egress_events/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress_event = EgressEvent.find(params[:id])
    @egress_event.destroy

    respond_to do |format|
      format.html { redirect_to egresses_url }
      format.json { head :no_content }
    end
   else
      redirect_to "/home/principal"
   end
  end

end
