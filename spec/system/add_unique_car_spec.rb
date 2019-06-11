# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a unique car', type: :system do
  let(:user) { create(:user) }
  let!(:photo_url) { 'http://insecure.photo/test-photo.jpg' }

  it 'allows a car to be added to a user' do
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

    login_as(user)

    visit profile_path
    click_link('Add a new car!')
    select 'Ford', from: 'car_id'
    click_on('Create Ownedcar')

    visit profile_path
    expect(page).to have_selector('#ownedcar_1', text: '1999 Ford')
  end
end
