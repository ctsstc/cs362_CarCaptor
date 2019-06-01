# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { create(:user) }

  it 'adds a garage upon creation' do
    expect { subject }.to change { Garage.count }.by(1)
  end

  describe 'user has a garage' do
    subject { user.garage }
    it { should_not be_nil }
  end
end
