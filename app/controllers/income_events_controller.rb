class IncomeEventsController < ApplicationController
  # GET /income_events
  # GET /income_events.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_events = IncomeEvent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @income_events }
    end
else
      redirect_to "/home/principal"
   end
  end

  # GET /income_events/1
  # GET /income_events/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_event = IncomeEvent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income_event }
    end
else
      redirect_to "/home/principal"
   end
  end

  # GET /income_events/new
  # GET /income_events/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_event = IncomeEvent.new
    @income = Income.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income_event }
      format.json { render json: @income}
    end
else
      redirect_to "/home/principal"
   end 
 end

  # GET /income_events/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_event = IncomeEvent.find(params[:id])
 else
      redirect_to "/home/principal"
   end 
 end

  # POST /income_events
  # POST /income_events.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_event = IncomeEvent.new(params[:income_event])
    i=Income.find(params[:income])
    @income_event.event = (Event.where(:id => params[:event_id])).first
    @income_event.income=i
    
    respond_to do |format|
      if @income_event.save
        format.html { redirect_to @income_event, notice: 'Income event was successfully created.' }
        format.json { render json: @income_event, status: :created, location: @income_event }
      else
        format.html { render action: "new" }
        format.json { render json: @income_event.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # PUT /income_events/1
  # PUT /income_events/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_event = IncomeEvent.find(params[:id])

    respond_to do |format|
      if @income_event.update_attributes(params[:income_event])
        format.html { redirect_to @income_event, notice: 'Income event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income_event.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # DELETE /income_events/1
  # DELETE /income_events/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_event = IncomeEvent.find(params[:id])
    @income_event.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  else
      redirect_to "/home/principal"
   end
  end
end
