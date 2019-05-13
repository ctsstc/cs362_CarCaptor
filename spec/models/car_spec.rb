require 'rails_helper'

RSpec.describe Car, type: :model do

    let(:car) { FactoryBot.create(:car) }
    
    it "expects a new car to have all its parameters" do
      expect(car.year).to eq(1900)
      expect(car.make).to eq("Some")
      expect(car.model).to eq("Turd")
      expect(car.coolness_value).to eq(1)
      expect(car.horsepower).to eq(20)
      expect(car.torque).to eq(20)
      expect(car.weight).to eq(6000)
    end

    it "calculates power-to-weight ratio properly" do
      car2 = FactoryBot.create(:car, year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
      pwr_expected = 2000.fdiv(5000)
      expect(car2.calculate_power_to_weight_ratio).to eq(pwr_expected)
    end

    it "a car with a higher power-to-weight ratio should win a drag race" do
      car1 = FactoryBot.create(:car, year: 1997, make: "Ford", model: "High Ratio", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
      car2 = FactoryBot.create(:car, year: 1997, make: "Ford", model: "Low Ratio", coolness_value: 9, horsepower: 200, torque: 200, weight: 5000)
      expect(car1.car.does_opponent_win_simple_drag_race?(car2.car)).to be false
    end

    it "expects setup to alter default parameters of an already defaulted car" do
      car.setup(year: 1999, 
        make: "Ford", 
        model: "Explorer", 
        coolness_value: 1, 
        horsepower: 160,
        torque: 225,
        weight: 3891 )
      expect(car.year).to eq(1999)
      expect(car.make).to eq("Ford")
      expect(car.model).to eq("Explorer")
      expect(car.coolness_value).to eq(1)
      expect(car.horsepower).to eq(160)
      expect(car.torque).to eq(225)
      expect(car.weight).to eq(3891)
    end

    it "can calculate power to weight ratios for itself" do
      car.setup(year: 1999, 
        make: "Ford", 
        model: "Explorer", 
        coolness_value: 1, 
        horsepower: 160,
        torque: 225,
        weight: 3891 )
      expect(car.calculate_power_to_weight_ratio).to eq(0.0411)
    end
end
