class IncomeTnsController < ApplicationController
  # GET /income_tns
  # GET /income_tns.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_tns = IncomeTn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @income_tns }
    end
  else
      redirect_to "/home/principal"
   end
  end

  # GET /income_tns/1
  # GET /income_tns/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_tn = IncomeTn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income_tn }
      

    end
   else
      redirect_to "/home/principal"
   end
  end

  # GET /income_tns/new
  # GET /income_tns/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_tn = IncomeTn.new
    @income = Income.find(params[:id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income_tn }
      format.json { render json: @income}
    end
   else
      redirect_to "/home/principal"
   end
  end

  # GET /income_tns/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_tn = IncomeTn.find(params[:id])
  else
      redirect_to "/home/principal"
   end
  end

  # POST /income_tns
  # POST /income_tns.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_tn = IncomeTn.new(params[:income_tn])
    i=Income.find(params[:income])
    @income_tn.tn = (Tn.where(:tn_Id => params[:tn_Id])).first
    @income_tn.income=i

    respond_to do |format|
      if @income_tn.save
        format.html { redirect_to @income_tn, notice: 'Income tn was successfully created.' }
        format.json { render json: @income_tn, status: :created, location: @income_tn }
      else
        format.html { render action: "new" }
        format.json { render json: @income_tn.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # PUT /income_tns/1
  # PUT /income_tns/1.json
  def update
     u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
     @income_tn = IncomeTn.find(params[:id])

    respond_to do |format|
      if @income_tn.update_attributes(params[:income_tn])
        format.html { redirect_to @income_tn, notice: 'Income tn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income_tn.errors, status: :unprocessable_entity }
      end
    end
  else
      redirect_to "/home/principal"
   end
  end

  # DELETE /income_tns/1
  # DELETE /income_tns/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income_tn = IncomeTn.find(params[:id])
    @income_tn.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  else
      redirect_to "/home/principal"
   end
  end
end
