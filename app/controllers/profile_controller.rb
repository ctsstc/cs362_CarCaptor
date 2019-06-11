# frozen_string_literal: true

class ProfileController < ApplicationController
  before_action :authenticate_user!

  def index
    @owned_cars = current_user.ownedcars
  end

  def challenge
    @users = User.where.not(id: current_user.id)
  end

  def commence_challenge
    @user_one = current_user
    @user_two = User.find_by(username: params[:second])
  end

  def add_car
    @new_ownedcar = Ownedcar.new
    @cars = Car.all
  end
end
