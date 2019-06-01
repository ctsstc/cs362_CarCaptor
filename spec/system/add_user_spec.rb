# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'adding a user', type: :system do
  it 'allows a new user to be created' do
    visit new_user_path
    fill_in 'Username', with: 'Dalton'
    fill_in 'Password', with: 'bigpass123'
    fill_in 'Email', with: 'example@gmail.com'
    click_on('Create User')
    visit users_path
    @user = User.find_by(username: 'Dalton')
    expect(page).to have_selector("#user_#{@user.id} .username", text: 'Dalton')
    expect(page).to have_selector("#user_#{@user.id} .password", text: 'bigpass123')
    expect(page).to have_selector("#user_#{@user.id} .email", text: 'example@gmail.com')
    visit user_path(@user)
    expect(page).to have_content('Dalton')
    expect(page).to have_content('example@gmail.com')
  end
end
