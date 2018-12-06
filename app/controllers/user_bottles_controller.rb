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
end
