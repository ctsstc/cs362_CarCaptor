# frozen_string_literal: true

class OwnedcarsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
    @ownedcar = Ownedcar.new
  end

  def index
    @ownedcars = Ownedcar.all
  end

  def create
    car = Car.find(params[:car_id])
    ownedcar = Ownedcar.create(
      year: car.year,
      make: car.make,
      model: car.model,
      coolness_value: car.coolness_value,
      horsepower: car.horsepower,
      torque: car.torque,
      weight: car.weight,
      user: current_user,
      photo_url: car.photo_url
    )
    if ownedcar.save
      redirect_to profile_path(params[:user_id])
    else
      redirect_to ownedcars_path
    end
  end
end
