class EpsController < ApplicationController
  # GET /eps
  # GET /eps.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @eps = Ep.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @eps }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /eps/1
  # GET /eps/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @ep = Ep.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ep }
    end
  else
      redirect_to "/home/principal"
  end
  end

  # GET /eps/new
  # GET /eps/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @ep = Ep.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ep }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /eps/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @ep = Ep.find(params[:id])
    else
      redirect_to "/home/principal"
    end
  end

  # POST /eps
  # POST /eps.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    @ep = Ep.new(params[:ep])
    @ep.program=(params[:program])
    @ep.user=u
    respond_to do |format|
      if @ep.save
        format.html { redirect_to @ep, notice: 'Ep was successfully created.' }
        format.json { render json: @ep, status: :created, location: @ep }
      else
        format.html { render action: "new" }
        format.json { render json: @ep.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to "/home/principal"
    end
  end

  # PUT /eps/1
  # PUT /eps/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
   @ep = Ep.find(params[:id])

    respond_to do |format|
      if @ep.update_attributes(params[:ep])
        format.html { redirect_to @ep, notice: 'Ep was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ep.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to "/home/principal"
    end
  end

  # DELETE /eps/1
  # DELETE /eps/1.json
  def destroy
   u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
   @ep = Ep.find(params[:id])
    @ep.destroy

    respond_to do |format|
      format.html { redirect_to eps_url }
      format.json { head :no_content }
    end
    else
      redirect_to "/home/principal"
    end
  end

end
