class BottlesController < ApplicationController
  def index
    @bottles = Bottle.all
    @user_bottle = UserBottle.new
  end

  def show

    @bottle = Bottle.find(params[:id])
  end

  def new
  end

  def create
  end

  private
  def bottle_params
  params.recquire(:bottle).permit(:title)

  end
end
