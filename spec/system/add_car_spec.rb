# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a car', type: :system do
  let!(:photo_url) { 'http://insecure.photo/test-photo.jpg' }

  it 'allows a user to create a car' do
    visit new_car_path
    fill_in 'Year', with: '1999'
    fill_in 'Make', with: 'Ford'
    fill_in 'Model', with: 'Mustang'
    fill_in 'Coolness value', with: 5
    fill_in 'Horsepower', with: 260
    fill_in 'Torque', with: 302
    fill_in 'Weight', with: 3273
    fill_in 'Photo url', with: photo_url
    click_on('Create Car')
    visit cars_path
    @car = Car.find_by(model: 'Mustang')
    expect(page).to have_selector("#car_#{@car.id} .year", text: '1999')
    expect(page).to have_selector("#car_#{@car.id} .make", text: 'Ford')
    expect(page).to have_selector("#car_#{@car.id} .model", text: 'Mustang')
    expect(page).to have_selector("#car_#{@car.id} .coolness_value", text: '5')
    expect(page).to have_selector("#car_#{@car.id} .horsepower", text: '260')
    expect(page).to have_selector("#car_#{@car.id} .torque", text: '302')
    expect(page).to have_selector("#car_#{@car.id} .weight", text: '3273')
    expect(page).to have_selector("#car_#{@car.id} .weight", text: '3273')
    expect(page).to have_selector("#car_#{@car.id} .photo")
  end
end
