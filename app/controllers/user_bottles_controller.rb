class UserBottlesController < ApplicationController

  def index
    @user_bottles = UserBottle.all

  end

  def new
  end

  def create
  end

end
