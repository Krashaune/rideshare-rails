class TripsController < ApplicationController
  def index

    @trips = Trip.all

  end

  def new
    @trip = Trip.new
  end

  def create

    if params[:passenger_id]
      passenger = Passenger.find(params[:passenger_id])
      trip = passenger.request_trip
      redirect_to trip_path(trip)
    else
      trip = Trip.new(trip_params)
      if trip.save
        redirect_to trips_path
      end
    end
  end

  def show
    trip_id = params[:id]

    @trip = Trip.find(trip_id)
  end

  def edit
    @trip = Trip.find(params[:id])
  end

  def update
    @trip = Trip.find(params[:id])

    @trip.assign_attributes(trip_params)

    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :edit
    end
  end

  def destroy
    trip = Trip.find(params[:id])
    if params[:passenger_id]
      Trip.destroy(params[:id])
      redirect_to passenger_path(trip.passenger)
    else params[:driver_id]
      Trip.destroy(params[:id])
      redirect_to driver_path(trip.driver)
    end


  end


  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost)
  end

end
