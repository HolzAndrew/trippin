class TripsController < ApplicationController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]


  # GET /trips
  # GET /trips.json
  def index

    #this piece of magic is a query to get the trips under only 1 user
    trip_list = TripUserList.all
    query =  TripUserList.where("user_id="+(session[:user_id]).to_s)
    #angela_merkel will hold a trip id, just for shits and giigles
    angela_merkel = query.to_a[0].trip_id
    @trips = Trip.where("id="+angela_merkel.to_s)
    # debugger
    # @participants = trip_list.where("user_id="+(session[:user_id]).to_s)

    @invitations = Invitation.where(email: session[:user_email])

    #trip_user_lists = TripUserList.all
    #@trips = Trip.joins(:trip_user_lists).where('trip_user_lists.user_id' => session[:user_id])

  end
  # GET /trips/1
  # GET /trips/1.json
  def show
    @invitations = Invitation.where(email: session[:user_email])
    @trip = Trip.find params[:id]
    #angela_merkel will hold a trip id for 
    angela_merkel = params[:id].to_s
    trip_list = TripUserList.where("trip_id="+angela_merkel)
  end

  # GET /trips/new
  def new
    @trip = Trip.new
  end

  # GET /trips/1/edit
  def edit
  end

  # POST /trips
  # POST /trips.json
  def create
    @trip = Trip.new(trip_params)
    respond_to do |format|
      if @trip.save
        @trip_user_list = TripUserList.new(trip_id: @trip.id,user_id: session[:user_id])
        # binding.pry
        @trip_user_list.save
        format.html { redirect_to "/trips/#{@trip.id}/locations", notice: 'Trip was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    respond_to do |format|
      if @trip.update(trip_params)
        format.html { redirect_to @trip, notice: 'Trip was successfully updated.' }
      else
        format.html { render :index }
      end
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    respond_to do |format|
      format.html { redirect_to trips_url, notice: 'Trip was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trip
      @trip = Trip.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def trip_params
      binding.pry
      params['trip']['user_id'] = session[:user_id]
      params.require(:trip).permit(:name, :lat, :lng, :trip_date,  :description, :user_id)
    end
end
