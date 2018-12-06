class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def landing
  end

  def home
    @user_bottles = Bottle.of_user(current_user).count
    @user_red_bottles = Bottle.of_user(current_user).color("the Color").count
    @user_yellow_bottles = Bottle.of_user(current_user).color("blanc").count
    @user_pink_bottles = Bottle.of_user(current_user).color("rosé").count
    @user_champ_bottles = Bottle.of_user(current_user).color("pétillant").count
  end
end
