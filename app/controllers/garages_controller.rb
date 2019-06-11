class GaragesController < ApplicationController
  before_action :set_user, only: [:create]

  def new
    @garage = Garage.new
  end

  def index
    @garages = Garage.all
  end

  def create
    @garage = Garage.create(
      capacity: params[:garage][:capacity],
      user: @user
    )
    if @garage.save
      redirect_to garages_path
    else
      render :new
    end
  end

  private

  def set_user
    @user = current_user
  end
end
