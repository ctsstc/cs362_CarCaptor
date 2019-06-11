# frozen_string_literal: true

class Garage < ApplicationRecord
  belongs_to :user
  has_many :cars, dependent: :destroy

  def total_coolness
    cars.sum(:coolness_value)
  end

  def add(car = Car.new)
    return false if full?

    cars << car
  end

  def lame?
    cars.empty?
  end

  def full?
    cars.length == capacity
  end
end
