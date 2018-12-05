class BottlesController < ApplicationController
  before_action :set_bottle, only: [:show]
  def show
  end

  private

  def bottle_params
    params.recquire(:bottle).permit(:title)
  end

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
