# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Garage, type: :model do
  let(:user) { build(:user) }
  let(:car) { build(:car) }
  let(:another_car) { build(:car) }
  subject { build(:garage, user: user) }

  describe 'empty garage' do
    it 'expects a new garage to have no cars' do
      expect(subject.cars.length).to eq(0)
    end

    it 'expects a garage with no cars to be lame' do
      expect(subject).to be_lame
    end
  end

  describe 'garage with a car' do
    before do
      subject.add(car)
    end

    it 'has 1 car' do
      expect(subject.cars.length).to eq(1)
    end

    it 'is not lame' do
      expect(subject).to_not be_lame
    end

    it 'increases car amount by 1' do
      expect { subject.add }.to change { subject.cars.length }.by(1)
    end

    it 'is not full' do
      expect(subject.full?).to eq(false)
    end
  end

  describe 'a garage at full capacity' do
    subject { build(:garage, capacity: 1) }

    before do
      subject.add(car)
    end

    it 'returns false when trying to add a car to a full garage' do
      expect(subject.add(another_car)).to eq(false)
    end

    it 'does not increase the cars in the garage' do
      expect { subject.add(another_car) }.not_to change { subject.cars.length }
    end

    it 'is full' do
      expect(subject.full?).to eq(true)
    end
  end

  describe 'cars persist' do
    subject { create(:garage, user: user) }
    let(:car) { create(:car) }

    before do
      subject.add(car)
    end

    it 'still has a car after reloading' do
      expect { subject.reload }.not_to change { subject.cars.count }
    end
  end

  describe 'multiple cars' do
    subject { create(:garage, user: user) }

    before do
      subject.add(car)
      subject.add(another_car)
    end

    it 'has a total coolness' do
      expect(subject.total_coolness).to eq(2)
    end

    it 'updates total coolness when a car\'s coolness increases' do
      expect do
        car.update_attributes(coolness_value: 4)
      end.to change { subject.total_coolness }.by(3)
    end
  end

end
