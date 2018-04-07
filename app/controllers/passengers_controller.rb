class PassengersController < ApplicationController

  def index
    @passengers = Passenger.all

  end

  def new
    @passenger = Passenger.new
  end

  def create
    @passenger = Passenger.new(passenger_params)

    if @passenger.save
      redirect_to passengers_path
    else
      # Validations failed! What do we do now? See below...
      render :new
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
    @passenger = Passenger.find(params[:id])

    @passenger.assign_attributes(passenger_params)

    if @passenger.save
      redirect_to passenger_path(@passenger)
    else
      render :edit
    end
  end

  def destroy
    Passenger.destroy(params[:id])

    redirect_to passengers_path
  end


  private

  def passenger_params
    return params.require(:passenger).permit(:name, :phone_num)
  end

end
