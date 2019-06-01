# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ownedcar, type: :model do
  let(:ownedcar) { FactoryBot.build(:ownedcar, :civic) }
  let(:ownedcar2) { FactoryBot.build(:ownedcar, :ae86) }

  it 'expects a new car to have all its parameters' do
    expect(civic.year).to eq(2001)
    expect(civic.make).to eq('Honda')
    expect(civic.model).to eq('Civic')
    expect(civic.coolness_value).to eq(1)
    expect(civic.horsepower).to eq(190)
    expect(civic.torque).to eq(220)
    expect(civic.weight).to eq(3690)
  end

  it 'can calculate power to weight ratio' do
    pwr_expected = 190.fdiv(3690)
    expect(civic.calculate_power_to_weight_ratio).to eq(pwr_expected)
  end

  it 'expects a car with higher ptwr to win' do
    expect(civic.does_opponent_win_simple_drag_race?(ownedcar2)).to be true
    expect(ownedcar2.does_opponent_win_simple_drag_race?(ownedcar)).to be false
  end

  it 'expects setup to alter default parameters of an already defaulted car' do
    civic.setup(
      year: 1999,
      make: 'Ford',
      model: 'Explorer',
      coolness_value: 1,
      horsepower: 160,
      torque: 225,
      weight: 3891
    )
    expect(civic.year).to eq(1999)
    expect(civic.make).to eq('Ford')
    expect(civic.model).to eq('Explorer')
    expect(civic.coolness_value).to eq(1)
    expect(civic.horsepower).to eq(160)
    expect(civic.torque).to eq(225)
    expect(civic.weight).to eq(3891)
  end

  it 'can print out the values we want the user to see' do
    civic.setup(
      year: 1999,
      make: 'Ford',
      model: 'Explorer',
      coolness_value: 1,
      horsepower: 160,
      torque: 225,
      weight: 3891
    )
    expect(civic.info).to eq('1999 Ford Explorer, hp 160, tq 225, weight 3891')
  end
end
