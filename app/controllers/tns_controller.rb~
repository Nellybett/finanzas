class TnsController < ApplicationController
  # GET /tns
  # GET /tns.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tns = Tn.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tns }
    end
   else
      redirect_to "/home/principal"
    end
  end

  # GET /tns/1
  # GET /tns/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tn = Tn.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tn }
    end
   else
      redirect_to "/home/principal"
    end
  end

  # GET /tns/new
  # GET /tns/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tn = Tn.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tn }
    end
   else
      redirect_to "/home/principal"
    end
  end

  # GET /tns/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tn = Tn.find(params[:id])

   else
      redirect_to "/home/principal"
    end
  end

  # POST /tns
  # POST /tns.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tn = Tn.new(params[:tn])
    @tn.program=(params[:program])
    @tn.user=u
    respond_to do |format|
      if @tn.save
        format.html { redirect_to @tn, notice: 'Tn was successfully created.' }
        format.json { render json: @tn, status: :created, location: @tn }
      else
        format.html { render action: "new" }
        format.json { render json: @tn.errors, status: :unprocessable_entity }
      end
    end
   else
      redirect_to "/home/principal"
    end
  end

  # PUT /tns/1
  # PUT /tns/1.json
  def update
   u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tn = Tn.find(params[:id])

    respond_to do |format|
      if @tn.update_attributes(params[:tn])
        format.html { redirect_to @tn, notice: 'Tn was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tn.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to "/home/principal"
    end
  end

  # DELETE /tns/1
  # DELETE /tns/1.json
  def destroy
   u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
   
    @tn = Tn.find(params[:id])
    @tn.destroy

    respond_to do |format|
      format.html { redirect_to tns_url }
      format.json { head :no_content }
    end
    else
      redirect_to "/home/principal"
    end
  end
end
