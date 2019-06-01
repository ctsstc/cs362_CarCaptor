# frozen_string_literal: true

class Garage < ApplicationRecord
  belongs_to :user
  has_many :cars

  def total_coolness
    cars.sum(:coolness_value)
  end

  def add(car = Car.new)
    return false unless cars.length < capacity

    cars << car
  end

  def lame?
    cars.empty?
  end
end
