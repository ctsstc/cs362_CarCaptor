class Garage < ApplicationRecord
  belongs_to :user
  has_many :cars

  def total_coolness
    cars.sum(:coolness_value)
  end

  def add(car = Car.new)
    cars << car
  end

  def lame?
    cars.empty?
  end

  def count_cars
    cars.size
  end
end
