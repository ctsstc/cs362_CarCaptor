# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Garage, type: :model do
  let!(:user) { create(:user) }
  let(:garage) { create(:garage, user: user) }

  describe 'empty garage' do
    it 'expects a new garage to have no cars' do
      expect(garage.cars.length).to eq(0)
    end

    it 'expects a garage with no cars to be lame' do
      expect(garage).to be_lame
    end
  end

  describe 'garage with a car' do
    let(:car) { create(:car) }

    before do
      garage.add(car)
    end

    it 'has 1 car' do
      expect(garage.cars.length).to eq(1)
    end

    it 'is not lame' do
      expect(garage).to_not be_lame
    end

    it 'increases car amount by 1' do
      expect { garage.add }.to change { garage.cars.length }.by(1)
    end
  end
end
