class UsersController < ApplicationController
  # GET /users
  # GET /users.json


before_filter :login_required, :only=>['welcome', 'change_password', 'hidden']


  def index
  u=User.find(session[:user])  
     if u.role=='Admin'
       @users = User.all
        respond_to do |format|
         format.html # index.html.erb
         format.json { render json: @users }
	end
       else
       redirect_to "/home/principal"
      end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end

 # GET /users/new
  # GET /users/new.json
  def new
    u=User.find(session[:user])
    if u.role=='Admin'
    
    @user = User.new
       
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
    else
      redirect_to "/home/principal"
    end
    
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

# POST /users
  # POST /users.json
  def create
    u=User.find(session[:user])
    if u.role=='Admin'
    
    @user = User.new(params[:user])
    @user.role='Member'
    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
    else
      redirect_to "/home/principal"
    end
  end


def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end


def signup
    @user = User.new(params[:user])
    if request.post?
    @user.role='Nuevo'
      if @user.save
        session[:user] = User.authenticate(@user.username, @user.password)
        flash[:message] = "Signup successful"
        redirect_to root_url
      else
        flash[:warning] = "Signup unsuccessful"
      end
    end
  end



  def login
    if request.post?
      if session[:user] = User.authenticate(params[:user][:username], params[:user][:password])
        flash[:message]  = "Login successful"
        redirect_to "/home/index"
      else
        flash[:warning] = "Login unsuccessful"
      end
    end
  end


  def logout
    session[:user] = nil
    flash[:message] = 'Logged out'
    redirect_to '/users/login'
  end


def change_password
    @user=session[:user]
    if request.post?
      @user.update_attributes(:password=>params[:user][:password])
      if @user.save
        flash[:message]="Password Changed"
      end
    end
  end

  def welcome

  end

  def hidden

  end

def forgot_password
    if request.post?
      user= (User.where(:email => params[:user][:email])).first

      if ((user.nil?)==false) and user.send_new_password
        flash[:message]  = "A new password has been sent by email."
        redirect_to '/users/login'
      else
        flash[:warning]  = "Couldn't send password"
      end
    end
  end

end

