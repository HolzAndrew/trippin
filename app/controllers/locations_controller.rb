class LocationsController < ApplicationController

  # GET /locations
  def index
    # binding.pry
    @locations = Location.where(trip_id: params[:trip_id])
    @trip = Trip.find(params[:trip_id])
    @location = Location.new
  end


  # POST /locations
  def create
    @trip = Trip.find(params[:trip_id])
    @location = Location.new(location_params)
    @location.save
    @locations = Location.where(trip_id: params[:trip_id])
    redirect_to trip_locations_path(@trip,@locations)
    # respond_to do |format|
    #   if @location.save
    #     format.html { redirect_to trip_locations_path(@trip,@locations), notice: 'Location was successfully created.' }
    #   else
    #     format.html { render :index }
    #   end
    # end
  end

  # DELETE /locations/1
  def destroy
    @trip = Trip.find(params[:trip_id])
    @location = Location.find(params[:id])
    @location.destroy
    respond_to do |format|
      format.html { redirect_to [@trip,@location], notice: 'Location was successfully destroyed.' }
    end
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params['location']['user_id'] = session[:user_id]
      params['location']['trip_id'] = params[:trip_id]
      params.require(:location).permit(:loc_lng, :loc_lat, :address, :venue, :trip_id, :user_id)
    end
end
