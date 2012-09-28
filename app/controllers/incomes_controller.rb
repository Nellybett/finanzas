class IncomesController < ApplicationController
  # GET /incomes
  # GET /incomes.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    if u.role == 'Admin'
    @incomes = Income.all
    end
    if u.role == 'Member'
    @incomes = Income.where(:user_id => u.id)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @incomes }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /incomes/1
  # GET /incomes/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @income = Income.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @income }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /incomes/new
  # GET /incomes/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @income = Income.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @income }
    end
  else
      redirect_to "/home/principal"
  end
  end

  # GET /incomes/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @income = Income.find(params[:id])
    else
      redirect_to "/home/principal"
    end
  end

  # POST /incomes
  # POST /incomes.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @income = Income.new(params[:income])
    @income.type_of_payment=(params[:type_of_payment])
    @income.user=u
    respond_to do |format|
      if @income.save
        format.html { redirect_to @income, notice: 'Income was successfully created.' }
        format.json { render json: @income, status: :created, location: @income }
      else
        format.html { render action: "new" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    
    end
    else
      redirect_to "/home/principal"
    end
  end

  # PUT /incomes/1
  # PUT /incomes/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @income = Income.find(params[:id])

    respond_to do |format|
      if @income.update_attributes(params[:income])
        format.html { redirect_to @income, notice: 'Income was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @income.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to "/home/principal"
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @income = Income.find(params[:id])
    @income.destroy

    respond_to do |format|
      format.html { redirect_to incomes_url }
      format.json { head :no_content }
    end
  
  else
      redirect_to "/home/principal"
   end
end
end
