# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def challenge
    @users = User.all
  end

  def add
    @cars = Car.all
    @ownedcar = Ownedcar.new
    @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
  end

  def commence_challenge
    @user_one = User.find(params[:first])
    @user_two = User.find(params[:second])
  end

  def create
    user = User.create(
      username: params[:user][:username],
      password: params[:user][:password],
      email: params[:user][:email]
    )
    if user.save
      redirect_to user_path(user)
    else
      render :new
    end
  end
end