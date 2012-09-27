class IncomeEpsController < ApplicationController
  # GET /income_eps
  # GET /income_eps.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_eps = IncomeEp.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @income_eps }
    end
   else
      redirect_to "/home/principal"
   end
  end

  # GET /income_eps/1
  # GET /income_eps/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_ep = IncomeEp.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income_ep }
    end
   else
      redirect_to "/home/principal"
   end
  end

  # GET /income_eps/new
  # GET /income_eps/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_ep = IncomeEp.new
    @income = Income.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income_ep}
      format.json { render json: @income}
    end
    else
      redirect_to "/home/principal"
   end
  end

  # GET /income_eps/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_ep = IncomeEp.find(params[:id])
  else
      redirect_to "/home/principal"
   end
  end

  # POST /income_eps
  # POST /income_eps.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
     @income_ep = IncomeEp.new(params[:income_ep])
    i=Income.find(params[:income])
    @income_ep.ep = (Ep.where(:ep_Id => params[:ep_Id])).first
    @income_ep.income=i
    respond_to do |format|
      if @income_ep.save
        format.html { redirect_to @income_ep, notice: 'Income ep was successfully created.' }
        format.json { render json: @income_ep, status: :created, location: @income_ep }
      else
        format.html { render action: "new" }
        format.json { render json: @income_ep.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # PUT /income_eps/1
  # PUT /income_eps/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_ep = IncomeEp.find(params[:id])

    respond_to do |format|
      if @income_ep.update_attributes(params[:income_ep])
        format.html { redirect_to @income_ep, notice: 'Income ep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income_ep.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # DELETE /income_eps/1
  # DELETE /income_eps/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_ep = IncomeEp.find(params[:id])
    @income_ep.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  else
      redirect_to "/home/principal"
   end
  end
end
