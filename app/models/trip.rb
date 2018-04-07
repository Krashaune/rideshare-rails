class Trip < ApplicationRecord
  belongs_to :driver
  belongs_to :passenger

  validates :rating, presence: true

  validates :rating, numericality: {only_integer: true, less_than_or_equal_to: 5}

  

end
