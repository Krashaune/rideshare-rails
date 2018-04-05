class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all

  end

  def new
    @passenger = Passenger.new
  end

  def create
    passenger = Passenger.new(passenger_params)

    if passenger.save
      redirect_to passengers_path
    end
  end

  def show
    passenger_id = params[:id]

    @passenger = Passenger.find(passenger_id)
  end

  def edit
    @passenger = Passenger.find(params[:id])
  end

  def update
    passenger = Passenger.find(params[:id])

    passenger.assign_attributes(passenger_params)

    if passenger.save
      redirect_to passenger_path(passenger)
    end
  end

  def destroy
    Passenger.destroy(params[:id])

    redirect_to passengers_path
  end

  # def complete
  #   passenger = Task.find(params[:id])
  #   passenger.completion_date = DateTime.now.strftime("%a, %B %d, %Y")
  #
  #   if passenger.status == "complete"
  #     passenger.assign_attributes(status: "not complete", completion_date: nil)
  #   else
  #     passenger.assign_attributes(status: "complete")
  #   end
  #
  #   if passenger.save
  #     redirect_to passengers_path
  #   end
  # end

  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
