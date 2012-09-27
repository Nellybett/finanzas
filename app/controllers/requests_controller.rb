class RequestsController < ApplicationController
  # GET /requests
  # GET /requests.json
  def index
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    
    if u.role == 'Admin'
    @requests=Request.where(:para => 'MC')
    end
    if u.role == 'Member' && u.last_Name=='F&L'
    @requests = Request.where("para =? OR user_id = ?", u.committee,u.id )
    end
    if u.role == 'Member' && u.last_Name!='F&L'
    @requests = Request.where(:user_id => u.id)
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @requests }
    end

    else
      redirect_to "/home/principal"
    end
  end

  # GET /requests/1
  # GET /requests/1.json
  def show
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @request = Request.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @request }
    end

    else
      redirect_to "/home/principal"
    end
  end

  # GET /requests/new
  # GET /requests/new.json
  def new
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @request = Request.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @request }
    end
    else
      redirect_to "/home/principal"
    end
  end

  # GET /requests/1/edit
  def edit
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')
    @request = Request.find(params[:id])
    else
      redirect_to "/home/principal"
    end
  end

  # POST /requests
  # POST /requests.json
  def create
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')

    @request = Request.new(params[:request])
    @request.para=params[:para]
    @request.user=u
    respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'Request was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
    else
      redirect_to "/home/principal"
    end
  end

  # PUT /requests/1
  # PUT /requests/1.json
  def update
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')

    @request = Request.find(params[:id])
    @request.para=params[:para]
    respond_to do |format|
      if @request.update_attributes(params[:request])
        format.html { redirect_to @request, notice: 'Request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end

   else
      redirect_to "/home/principal"
    end
  end

  # DELETE /requests/1
  # DELETE /requests/1.json
  def destroy
    u=User.find(session[:user])  
    if (u.role=='Admin' || u.role=='Member')

    @request = Request.find(params[:id])
    @request.destroy

    respond_to do |format|
      format.html { redirect_to requests_url }
      format.json { head :no_content }
    end
    else
      redirect_to "/home/principal"
    end
  end
end
