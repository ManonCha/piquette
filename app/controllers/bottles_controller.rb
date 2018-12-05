class BottlesController < ApplicationController

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
