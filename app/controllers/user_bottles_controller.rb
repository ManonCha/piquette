class UserBottlesController < ApplicationController

  def index
    @user_bottles = current_user.user_bottles
raise
  end

  def new
  end

  def create
  end

end
