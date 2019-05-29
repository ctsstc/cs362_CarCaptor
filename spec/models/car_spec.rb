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
      expect(car1.does_opponent_win_simple_drag_race?(car2)).to be false
    end

    it "can calculate power to weight ratios for itself" do
      horsepower = car.horsepower
      weight = car.weight
      pwr_expected = horsepower.fdiv(weight)
      expect(car.calculate_power_to_weight_ratio).to eq(pwr_expected)
    end

    # it "can perform a big dependency" do
    #   car_for_dep = FactoryBot.create(:car, year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
    #   expect(car_for_dep.perform(BigDependency.new)).to eq(1)
    # end

    it "can perform a big dependency fake" do
      car_for_dep = FactoryBot.create(:car, year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
      expect(car_for_dep.perform(TestBigDependency.new)).to eq(1)
    end

    it "can perform a big dependency stub" do
      car_for_dep = FactoryBot.create(:car, year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
      dep_stub = BigDependency.new
      allow(dep_stub).to receive(:execute).and_return(1)
      expect(car_for_dep.perform(dep_stub)).to eq(1)
    end

    it "can perform a big dependency mock" do
      car_for_dep = FactoryBot.create(:car, year: 1997, make: "Ford", model: "Thing", coolness_value: 9, horsepower: 2000, torque: 2000, weight: 5000)
      dep_mock = BigDependency.new
      expect(dep_mock).to receive(:execute).and_return(1)
      expect(car_for_dep.perform(dep_mock)).to eq(1)
    end
end