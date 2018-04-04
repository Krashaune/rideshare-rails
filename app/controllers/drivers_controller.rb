class DriversController < ApplicationController

  def index

    @drivers = Driver.all

  end

  def new
    @driver = Driver.new
  end

  def create
    driver = Driver.new(driver_params)

    if driver.save
      redirect_to drivers_path
    end
  end

  def show
    driver_id = params[:id]

    @driver = Driver.find(driver_id)
  end

  def edit
    @driver = Driver.find(params[:id])
  end

  def update
    driver = Driver.find(params[:id])

    driver.assign_attributes(driver_params)

    if driver.save
      redirect_to driver_path(driver)
    end
  end

  def destroy
    Driver.destroy(params[:id])

    redirect_to drivers_path
  end

  # def complete
  #   driver = Task.find(params[:id])
  #   driver.completion_date = DateTime.now.strftime("%a, %B %d, %Y")
  #
  #   if driver.status == "complete"
  #     driver.assign_attributes(status: "not complete", completion_date: nil)
  #   else
  #     driver.assign_attributes(status: "complete")
  #   end
  #
  #   if driver.save
  #     redirect_to drivers_path
  #   end
  # end

  private

  def driver_params
    return params.require(:driver).permit(:name, :vin)
  end

end
