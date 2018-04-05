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
    trip = Trip.find(params[:id])

    trip.assign_attributes(trip_params)

    if trip.save
      redirect_to trip_path(trip)
    end
  end

  def destroy
    Trip.destroy(params[:id])

    redirect_to trips_path
  end

  # def complete
  #   trip = Task.find(params[:id])
  #   trip.completion_date = DateTime.now.strftime("%a, %B %d, %Y")
  #
  #   if trip.status == "complete"
  #     trip.assign_attributes(status: "not complete", completion_date: nil)
  #   else
  #     trip.assign_attributes(status: "complete")
  #   end
  #
  #   if trip.save
  #     redirect_to trips_path
  #   end
  # end

  private

  def trip_params
    return params.require(:trip).permit(:date, :rating, :cost)
  end

end
