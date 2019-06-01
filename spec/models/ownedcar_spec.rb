# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ownedcar, type: :model do
  let(:user) { build(:user) }
  let(:civic) { FactoryBot.build(:ownedcar, :civic, user: user) }
  let(:ae86) { FactoryBot.build(:ownedcar, :ae86, user: user) }
  let(:ford_explorer) { build(:ownedcar, :ford_explorer, user: user) }

  it 'can calculate power to weight ratio' do
    pwr_expected = 190.fdiv(3690)
    expect(civic.calculate_power_to_weight_ratio).to eq(pwr_expected)
  end

  it 'expects a car with higher ptwr to win' do
    expect(civic.does_opponent_win_simple_drag_race?(ae86)).to be true
  end

  it 'displays car information' do
    ford_info = '1999 Ford Explorer, hp 160, tq 225, weight 3891'
    expect(ford_explorer.info).to eq(ford_info)
  end
end
