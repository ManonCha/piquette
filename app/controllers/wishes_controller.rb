class WishesController < ApplicationController
 before_action :set_wish, only: [:edit, :update, :destroy]
  def index
    @wishes = current_user.wishes
    @user_bottle = UserBottle.new
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
      respond_to do |format|
        format.html { redirect_to restaurant_path(@restaurant) }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'restaurants/show' }
        format.js  # <-- idem
      end
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
