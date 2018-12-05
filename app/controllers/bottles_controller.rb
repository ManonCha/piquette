class BottlesController < ApplicationController
  before_action :set_bottle, only: [:show]
  def show
    respond_to |format|
      format.html
      format.js
    end
  end

  private
  def bottle_params
    params.recquire(:bottle).permit(:title)
  end

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end
end
