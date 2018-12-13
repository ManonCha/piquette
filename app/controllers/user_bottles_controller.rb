class UserBottlesController < ApplicationController
  def index
    if params[:query].present?
      if !params[:color].present?
        @region = Region.where("name ILIKE ?", "%#{params[:query]}%").first
        @user_bottles_list = Bottle.of_user(current_user).where(region_id: @region.id)
      else
        if params[:color] == 'rouge'
          @user_bottles_list = Bottle.of_user(current_user).color('Rouge').where(region_id: @region.id)
        elsif params[:color] == 'blanc'
          @user_bottles_list = Bottle.of_user(current_user).color('Blanc').where(region_id: @region.id)
        elsif params[:color] == "rose"
          @user_bottles_list = Bottle.of_user(current_user).color('Rosé').where(region_id: @region.id)
        end
      end
    elsif params[:color].present?
      if params[:color] == 'rouge'
        @user_bottles_list = Bottle.of_user(current_user).color('Rouge')
      elsif params[:color] == 'blanc'
        @user_bottles_list = Bottle.of_user(current_user).color('Blanc')
      elsif params[:color] == "rose"
        @user_bottles_list = Bottle.of_user(current_user).color('Rosé')
      end
    else
      @user_bottles_list = Bottle.of_user(current_user)
    end

    @user_bottle = UserBottle.new
  end

  def new
  end

  def create
    if UserBottle.where(bottle_id: params[:user_bottle][:bottle_id]).first
      update_quantity
    else
      @user_bottle = UserBottle.new(
        bottle_id: params[:user_bottle][:bottle_id],
        quantity: params[:user_bottle][:quantity]
      )
      # raise
      @user_bottle.user = current_user
      @user_bottle.save
      redirect_to user_bottles_path
    end
  end

  def update_quantity
    if params[:addition_type]
      p params
      @user_bottle = UserBottle.find(params[:id])
      @user_bottle.quantity += params[:addition_type] == "plus" ? 1 : -1
      p @user_bottle
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
    else
      @user_bottle = UserBottle.where(bottle_id: params[:user_bottle][:bottle_id]).first
      @user_bottle.quantity += params[:user_bottle][:quantity].to_i
      if @user_bottle.save!
        redirect_to user_bottles_path
      end
    end
  end

  private

  def set_user_bottles
    @user_bottle = current_user.user_bottles.find(params[:id])
  end
end
