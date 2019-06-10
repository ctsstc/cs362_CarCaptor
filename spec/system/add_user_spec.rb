# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a user', type: :system do
  it 'allows a new user to be created' do
    visit root_path
    click_on('Register')
    # visit new_user_registration_path
    fill_in 'Username', with: 'Dalton'
    fill_in 'Password', with: 'bigpass123'
    fill_in 'user_password_confirmation', with: 'bigpass123'
    fill_in 'user_email', with: 'example@gmail.com'
    click_on('Sign up')
    expect(page).to have_content('Welcome! You have signed up successfully.')
    expect(page).to have_content('Hello Dalton')
  end
end
