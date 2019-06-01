# frozen_string_literal: true

class OwnedcarsController < ApplicationController
  def new
    @ownedcar = Ownedcar.new
  end

  def index
    @ownedcars = Ownedcar.all
  end

  def create
    car = Car.find(params[:car_id])
    user = User.find(params[:user_id])
    # render :inline => "<%= @user.username %>"
    ownedcar = Ownedcar.create(
      year: car.year,
      make: car.make,
      model: car.model,
      coolness_value: car.coolness_value,
      horsepower: car.horsepower,
      torque: car.torque,
      weight: car.weight,
      user: user
    )
    if ownedcar.save
      redirect_to user_path(params[:user_id])
    else
      redirect_to ownedcars_path
    end
  end
end
