class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def landing
  end

  def home
    @user_bottles = 0
    @user_red_bottles = 0
    @user_yellow_bottles = 0
    @user_pink_bottles = 0
    @user_champ_bottles = 0

    Bottle.of_user(current_user).each do |bottle|
      @user_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      if bottle.color.name == 'Rouge'
        @user_red_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.color.name == 'Blanc'
        @user_yellow_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.color.name == 'Rosé'
        @user_pink_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.color.name == 'Effervescent'
        @user_champ_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      end
    end
  end
end
