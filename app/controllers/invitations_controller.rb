class InvitationsController < ApplicationController
  before_action :set_invitation, only: [:show, :edit, :update, :destroy]

  # GET /invitations
  # GET /invitations.json
  def index
    @invitations = Invitation.where(email: session[:user_email])
    @num_of_invites = @invitations.length
    @invitation = Invitation.new
    @trips = Trip.joins(:trip_user_lists).where('trip_user_lists.user_id' => session[:user_id])
  end

  # POST /invitations
  # POST /invitations.json
  def create
    @invitation = Invitation.new(invitation_params)
    respond_to do |format|
      if @invitation.save
        if !User.find_by(email: @invitation.email)
          UserMailer.welcome_email(@invitation).deliver
        end
        format.html { redirect_to invitations_url, notice: 'Invitation was successfully sent.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /invitations/1
  # PATCH/PUT /invitations/1.json
  def update
    # binding.pry
    @trip_check = Trip.joins(:trip_user_lists).where('trip_user_lists.user_id' => session[:user_id]).find_by(id: @invitation.trip_id)
    @trip_user_list = TripUserList.new(trip_id: @invitation.trip_id,user_id: session[:user_id])
    respond_to do |format|
      if @trip_check
        @invitation.destroy
        format.html { redirect_to invitations_url, notice: 'You have already attended this trip!' }
      else
        @trip_user_list.save
        @invitation.destroy
        format.html { redirect_to trips_url, notice: 'Invitation was successfully accepted!' }
      end
    end
  end

  # DELETE /invitations/1
  # DELETE /invitations/1.json
  def destroy
    @invitation.destroy
    respond_to do |format|
      format.html { redirect_to invitations_url, notice: 'Invitation was successfully declined!' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_invitation
      @invitation = Invitation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def invitation_params
      params['invitation']['user_name'] = session[:user_name]
      params['invitation']['user_email'] = session[:user_email]
      params.require(:invitation).permit(:email, :trip_id, :user_name, :user_email)
    end
end
