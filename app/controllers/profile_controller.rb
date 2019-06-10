# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!, only: [:profile]

  def index; end

  def show; end

  def add_car
    @new_ownedcar = Ownedcar.new
    @cars = Car.all
  end
end
