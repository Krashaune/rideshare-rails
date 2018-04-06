require 'date'

class Passenger < ApplicationRecord
  has_many :trips


  validates :name, :phone_num, presence: true


  def total_spent
    total_spent = 0

    trips.each do |trip|
      total_spent += trip.cost
    end
    return total_spent/100
  end

  def request_trip
    # An available driver is selected automatically by the server
    # The trip starts with no rating
    # passenger data is already completed

    # find a driver - assign to variable
    # create an instance of trip
    # assign instance of trip to variable
    # pass in trip data to instance of trip
    # add the trip to passengers trips
    # add the trip to drivers trips

    driver = Driver.all.sample

    trip_data = {
      :date => Date.today,
      :driver_id => driver.id,
      :passenger_id => self.id,
      :cost => 679,
      :rating => 0,
    }
    request_trip = Trip.new(trip_data)

    self.trips << request_trip
    driver.trips << request_trip

    return request_trip
  end
end
