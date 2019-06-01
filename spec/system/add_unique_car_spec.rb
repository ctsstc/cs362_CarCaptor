# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a unique car', type: :system do
  it 'allows a car to be added to a new user' do
    visit new_car_path
    fill_in 'Year', with: '1999'
    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Coolness value', with: 5
    fill_in 'Horsepower', with: 260
    fill_in 'Torque', with: 302
    fill_in 'Weight', with: 3273
    click_on('Create Car')
    visit new_user_path
    fill_in 'Username', with: 'Dalton'
    fill_in 'Password', with: 'bigpass123'
    fill_in 'Email', with: 'example@gmail.com'
    click_on('Create User')
    visit users_path
    @user = User.find_by(username: 'Dalton')
    visit user_path(@user)
    click_link('addcarlink')
    select 'Ford', from: 'car_id'
    click_on('Create Ownedcar')
    visit user_path(@user)
    expect(page).to have_selector('#ownedcar_1', text: '1999 Ford')
  end
end
