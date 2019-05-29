class Car < ApplicationRecord
  validates :year, presence: true, numericality: { only_integer: true }

    def calculate_power_to_weight_ratio
      self.horsepower.fdiv(self.weight)
    end

    def info
      self.year.to_s + " " + self.make + " " + self.model + ", hp " + self.horsepower.to_s + ", tq " + self.torque.to_s + ", weight " + self.weight.to_s
    end

    def perform(big_dependency)
      big_dependency.execute
      return 1
    end

    def does_opponent_win_simple_drag_race?(opponent_car)
    if opponent_car.calculate_power_to_weight_ratio > self.calculate_power_to_weight_ratio
      true
    else
      false
    end
  end
end