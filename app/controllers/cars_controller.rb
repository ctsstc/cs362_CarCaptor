# frozen_string_literal: true

class CarsController < ApplicationController
  def new
    @car = Car.new
  end

  def show
    @car = Car.find(params[:id])
  end

  def index
    @cars = Car.all
  end

  def create
    @car = Car.create(
      year: params[:car][:year],
      make: params[:car][:make],
      model: params[:car][:model],
      coolness_value: params[:car][:coolness_value],
      horsepower: params[:car][:horsepower],
      torque: params[:car][:torque],
      weight: params[:car][:weight],
      photo_url: params[:car][:photo_url]
    )
    if @car.save
      redirect_to cars_path
    else
      render :new
    end
  end
end
