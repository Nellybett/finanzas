class EgressesController < ApplicationController
  # GET /egresses
  # GET /egresses.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    if u.role == 'Admin'
    @egresses = Egress.all
    end
    if u.role == 'Member'
    @egresses = Egress.where(:user_id => u.id)
    end
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @egresses }
    end
    
    else
      redirect_to "/home/principal"
    end
  end

  # GET /egresses/1
  # GET /egresses/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @egress = Egress.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @egress }
    end
   else
      redirect_to "/home/principal"
   end
  end

  # GET /egresses/new
  # GET /egresses/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @egress = Egress.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @egress }
    end

   else
      redirect_to "/home/principal"
   end
  end

  # GET /egresses/1/edit
  def edit
   u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member') 
    @egress = Egress.find(params[:id])
    else
      redirect_to "/home/principal"
   end
  end

  # POST /egresses
  # POST /egresses.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @egress = Egress.new(params[:egress])
    @egress.user=u
    respond_to do |format|
      if @egress.save
        format.html { redirect_to @egress, notice: 'Egress was successfully created.' }
        format.json { render json: @egress, status: :created, location: @egress }
      else
        format.html { render action: "new" }
        format.json { render json: @egress.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to "/home/principal"
   end
  end

  # PUT /egresses/1
  # PUT /egresses/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @egress = Egress.find(params[:id])

    respond_to do |format|
      if @egress.update_attributes(params[:egress])
        format.html { redirect_to @egress, notice: 'Egress was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @egress.errors, status: :unprocessable_entity }
      end
    end
   else
      redirect_to "/home/principal"
   end
  end

  # DELETE /egresses/1
  # DELETE /egresses/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @egress = Egress.find(params[:id])
    @egress.destroy

    respond_to do |format|
      format.html { redirect_to egresses_url }
      format.json { head :no_content }
    end
  
   else
      redirect_to "/home/principal"
   end
end
end
