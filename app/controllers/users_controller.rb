class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  # GET /users
  # GET /users.json
  def index
    # session[:user_id] = nil
    # binding.pry
    @user = User.new
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end

  # GET /users/1
  # GET /users/1.json
  def show
    #@trips = Trip.find params[:user_id]
    @user = User.find(params[:id])
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end
  # GET /users/1/edit
  def edit
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    # binding.pry
    respond_to do |format|
      check_email = User.find_by_email(@user.email)
      check_name = User.find_by_name(@user.name)
      if check_email
        format.html { redirect_to users_path, notice: 'The email already exists.' }
      elsif check_name
        format.html { redirect_to users_path, notice: 'The name already exists.' }
      elsif @user.password == ''
        format.html { redirect_to users_path, notice: 'Please enter your password.' }
      elsif @user.password != @user.password_confirmation
        format.html { redirect_to users_path, notice: 'Double check your password.' }
      elsif @user.save
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
        format.html { redirect_to trips_path, notice: 'Login Successful' }
      else
      # If user's login doesn't work, send them back to the login form.
        format.html { redirect_to users_path, notice: 'Login Error.' }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.name != params[:user][:name]
        check_name = User.find_by_name(params[:user][:name])
        if check_name
          format.html { redirect_to edit_user_path, notice: 'The name already exists.' }
        end
      elsif @user.email != params[:user][:email]
        check_email = User.find_by_email(params[:user][:email])
        if check_email
          format.html { redirect_to edit_user_path, notice: 'The email already exists.' }
        end
      elsif @user.update(user_update_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
      else
        format.html { redirect_to edit_user_path, notice: 'Edit failed.' }
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