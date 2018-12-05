class UserBottlesController < ApplicationController

  def index
    @user_bottles = current_user.user_bottles
  end

  def new
  end

  def create
  end

end
