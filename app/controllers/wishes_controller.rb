class WishesController < ApplicationController
 before_action :set_wish, only: [:edit, :update, :destroy]
  def index
    @wishes = current_user.wishes
  end

  def new
    @wish = Wish.new
  end

  def create
    @wish = Wish.new(wish_params)
    @bottle = Bottle.find(params[:bottle_id])
    @wish.user = current_user
    @wish.bottle = @bottle
    if @wish.save!
      redirect_to wishes_path
    else
      render 'new'
    end
  end

  def destroy
    @wish.destroy
    redirect_to wishes_path
  end

  private

  def wish_params
    params.recquire(:wish).permit(:bottle_id)
  end

  def set_wish
    @wish = Wish.find(params[:id])
  end
end
