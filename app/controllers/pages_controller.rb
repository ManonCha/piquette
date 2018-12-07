class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def landing
  end

  def home
    @user_bottles = Bottle.of_user(current_user).count
    @user_red_bottles = Bottle.of_user(current_user).color('Rouge').count
    @user_yellow_bottles = Bottle.of_user(current_user).color('Blanc').count
    @user_pink_bottles = Bottle.of_user(current_user).color('Rosé').count
    @user_champ_bottles = Bottle.of_user(current_user).color('Effervescent').count
  end
end
