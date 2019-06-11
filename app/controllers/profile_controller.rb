# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:index, :add_car]

  def index
    @owned_cars = current_user.ownedcars
  end

  def show; end

  def challenge
    @users = User.all
  end

  def commence_challenge
    @user_one = User.find_by(username: params[:first])
    @user_two = User.find_by(username: params[:second])
  end

  def add_car
    @new_ownedcar = Ownedcar.new
    @cars = Car.all
  end
end
