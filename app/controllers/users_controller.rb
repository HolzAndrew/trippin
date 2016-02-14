class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    # session[:user_id] = nil
    # binding.pry
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@trips = Trip.find params[:user_id]
    @user = User.find(params[:id])
  end
  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # binding.pry
    respond_to do |format|
      if @user.save
        # binding.pry
        session[:user_id] = @user.id
        session[:user_name] = @user.name
        session[:user_email] = @user.email
        format.html { redirect_to trips_path, notice: 'You successfully created your account.' }
      else
        format.html { render :index }
      end
    end
  end
  # POST
  def login
    user = User.find_by_email(params[:email])
    # If the user exists AND the password entered is correct.
    # binding.pry
    respond_to do |format|
      if user && user.authenticate(params[:password])
        # Save the user id inside the browser cookie. This is how we keep the user 
        # logged in when they navigate around our website.
        session[:user_id] = user.id
        session[:user_name] = user.name
        session[:user_email] = user.email
        format.html { redirect_to trips_path, notice: 'You are successfully login.' }
      else
      # If user's login doesn't work, send them back to the login form.
        redirect_to '/'
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_update_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
    def set_user
      if session[:user_id]
        @user = User.find(session[:user_id])
      end
    end


  # Never trust parameters from the scary internet, only allow the white list through.

    def user_params
      params.require(:user).permit(:name, :email, :password, :image_url)
    end

    def user_update_params
      params.require(:user).permit(:name, :email, :image_url)
    end
end