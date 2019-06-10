# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:index, :add_car]

  def index
    @owned_cars = current_user.ownedcars
  end

  def show; end

  def add_car
    @new_ownedcar = Ownedcar.new
    @cars = Car.all
  end
end
