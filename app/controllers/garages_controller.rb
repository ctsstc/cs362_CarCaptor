class GaragesController < ApplicationController
  def new
    @garage = Garage.new
  end
  
  def index
    @garages = Garage.all
  end

  def create
    garage = Garage.create(
      capacity: params[:garage][:capacity]
    )
    if garage.save
      redirect_to garages_path
    else
      render :new
    end
  end
end
