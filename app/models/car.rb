class Car < ApplicationRecord
  validates :year, presence: true, numericality: { only_integer: true }

  def calculate_power_to_weight_ratio
    horsepower.fdiv(weight)
  end

  def info
    "#{year} #{make} #{model}, hp #{horsepower}, tq #{torque}, weight #{weight}"
  end

  def does_opponent_win_simple_drag_race?(opponent_car)
    opponent_car.calculate_power_to_weight_ratio > calculate_power_to_weight_ratio
  end
end
