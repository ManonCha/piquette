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
    year = Date.today.year
    @garder = Bottle.where('best_after > ?', year +5)
    @boire = Bottle.of_user(current_user).where('best_after <= ?', year +5)
    @trop_vieux = 0

  end
end
