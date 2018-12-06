class BottlesController < ApplicationController
  before_action :set_bottle, only: [:show]

  def index
    @bottles = Bottle.all
    @user_bottle = UserBottle.new
  end

  def show
  end

  def new
  end

  def create
  end

  private

  def bottle_params
    params.require(:bottle).permit(:title)
  end

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
