class Driver < ApplicationRecord
  has_many :trips

  def total_revenue
    fee = 1.65
    driver_takehome = 0.8

    subtotal = 0
    trips.each do |trip|
      subtotal += trip.cost - fee
    end

    total = subtotal * driver_takehome
    return (total/100).round(2)
  end

  def average_rating
    total_ratings = 0
    trips.each do |trip|
      total_ratings += trip.rating
    end

    if trips.length == 0
      average = 0
    else
      average = (total_ratings.to_f) / trips.length
    end

    return average
  end
end
