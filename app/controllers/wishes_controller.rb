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
    @wish = Wish.new
    @bottle = Bottle.find(params[:bottle_id])
    @wish.bottle = @bottle
    @wish.user = current_user

    if @wish.save!
      respond_to do |format|
        format.html { redirect_to wishes_path }
        format.js  # <-- will render `app/views/wishes/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { redirect_to wishes_path }
        format.js  # <-- idem
      end
    end
  end

  def destroy
    @wish.destroy

    respond_to do |format|
      format.html { redirect_to wishes_path }
      format.js  # <-- will render `app/views/wishes/destroy.js.erb`
    end
  end

  private

  def set_wish
    @wish = current_user.wishes.find(params[:id])
  end
end
