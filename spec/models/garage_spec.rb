require 'rails_helper'

RSpec.describe Garage, type: :model do
    garage = Garage.new

    it "expects a new garage to have no cars" do
      expect(garage.cars.length).to eq(0) 
    end

    it "expects a garage with no cars to be lame" do
      expect(garage).to be_lame
    end

    describe "adding cars" do
      it "keeps track of the number of cars added" do
        garage.add(Car.new)
        expect(garage.cars.length).to eq(1)
            garage.add
            expect(garage.cars.length).to eq(2)
            expect(garage.count_cars).to eq(2)
      end

      it "expects a garage with at least one car with a positive coolness value to not be lame" do
        expect(garage).to_not be_lame
      end
    end
end
