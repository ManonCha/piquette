class UserBottlesController < ApplicationController

  def index
    @user_bottles = current_user.user_bottles
    # @review = Review.new
  end

  def new

  end

  def create
    @user_bottle = UserBottle.new(
      bottle_id: params[:user_bottle][:bottle_id],
      quantity: params[:user_bottle][:quantity]
    )
    @user_bottle.user = current_user
    @user_bottle.save
    redirect_to user_bottles_path
  end

  def update_quantity
    @user_bottle = UserBottle.find(params[:id])
    @user_bottle.quantity += params[:addition_type] == "plus" ? 1 : -1
    # binding.pry
    if @user_bottle.save
      respond_to do |format|
        format.html { redirect_to user_bottles_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render 'user_bottle/index' }
        format.js
      end
    end
  end
end
