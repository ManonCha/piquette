class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def landing
  end

  def home
    year = Date.today.year

    bottle_garder = Bottle.of_user(current_user).where('best_before > ?', year + 3)
    @garder = 0
    bottle_garder.each do |b|
      @garder += UserBottle.find_by(bottle_id: b.id).quantity
    end

    bottle_boire = Bottle.of_user(current_user).where('best_after > ?', year - 1).where('best_before < ?', year + 4)
    @boire = 0
    bottle_boire.each do |b|
      @boire += UserBottle.find_by(bottle_id: b.id).quantity
    end
    @trop_vieux = 0
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

    Bottle.of_user(current_user).each do |bottle|
      if bottle.region.name == 'Bordeaux'
        @user_bordeaux_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Alsace'
        @user_alsace_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Corse'
        @user_Corse_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Provence'
        @user_Provence_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Baujolais'
        @user_Baujolais_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Jura'
        @user_Jura_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Rhône'
        @user_Rhône_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Afrique du sud'
        @user_Afrique_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Argentine'
        @user_Argentine_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Languedoc'
        @user_Languedoc_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Roussillon'
        @user_Roussillon_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Chili'
        @user_Chili_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      end
    end
  end
end
