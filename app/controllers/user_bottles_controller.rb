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
    if @user_bottle.save
      respond_to do |format|
        format.html { redirect_to user_bottles_path }
        format.js  # <-- will render `app/views/reviews/create.js.erb`
      end
    else
      respond_to do |format|
        format.html { render 'user_bottle/index' }
        format.js  # <-- idem
      end
    end
  end

  # def minus
  #   @user_bottle = UserBottle.find(params[:user_bottle_id])
  #   @user_bottle.quantity -= 1
  #   if @user_bottle.save
  #     respond_to do |format|
  #       format.html { redirect_to user_bottles_path }
  #       format.js  # <-- will render `app/views/reviews/create.js.erb`
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render 'user_bottle/index' }
  #       format.js  # <-- idem
  #     end
  #   end
  # end

  # def plus
  #   @user_bottle = UserBottle.find(params[:user_bottle_id])
  #   @user_bottle.quantity += 1
  #   if @user_bottle.save
  #     respond_to do |format|
  #       format.html { redirect_to user_bottles_path }
  #       format.js  # <-- will render `app/views/reviews/create.js.erb`
  #     end
  #   else
  #     respond_to do |format|
  #       format.html { render 'user_bottle/index' }
  #       format.js  # <-- idem
  #     end
  #   end
  # end
end
