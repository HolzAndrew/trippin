class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # def current_user
  #   @current_user ||= User.find_by(:id, session["user_id"]).first
  # end

  # GET /users
  # GET /users.json
  def index
    @user = User.new
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # # GET /users/new
  # def new
  #   @user = User.new
  # end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    user = User.new(user_params)
    # binding.pry
    respond_to do |format|
      if user.save
        format.html { render :index, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: user }
        session[:user_id] = user.id
      else
        format.html { render :index }
        format.json { render json: user.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST
  def login
    user = User.find_by_email(params[:email])
    binding.pry
    # If the user exists AND the password entered is correct.
    if user && user.password_digest==params[:password_digest]
      # user.authenticate(params[:password_digest])
      # Save the user id inside the browser cookie. This is how we keep the user 
      # logged in when they navigate around our website.
      session[:user_id] = user.id
      redirect_to '/'
    else
    # If user's login doesn't work, send them back to the login form.
      redirect_to '/'
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :image_url)
    end
end
