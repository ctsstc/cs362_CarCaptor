class Garage < ApplicationRecord
    belongs_to :user
  has_many :car
  attr_accessor :cars

  def setup(params = {})
    self.user = params.fetch(:user, User.new)
    self.capacity = params.fetch(:capacity, 1)
    @cars = []
    self.car_count = 0
  end

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
