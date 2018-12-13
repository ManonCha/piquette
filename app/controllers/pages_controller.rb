class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :landing]

  def landing
  end

  def home
    year = Date.today.year

    bottle_garder = Bottle.of_user(current_user).where('best_after > ?', year + 4)
    @garder = 0
    bottle_garder.each do |b|
      @garder += UserBottle.find_by(bottle_id: b.id).quantity
    end

    bottle_boire = Bottle.of_user(current_user).where('best_after > ?', year - 1).where('best_before < ?', year + 5)
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
    @user_bordeaux_bottles = 0
    @user_alsace_bottles = 0
    @user_Corse_bottles = 0
    @user_Baujolais_bottles = 0
    @user_Jura_bottles = 0
    @user_Afrique_bottles = 0
    @user_Argentine_bottles = 0
    @user_Languedoc_bottles = 0
    @user_Roussillon_bottles = 0
    @user_Chili_bottles = 0
    @user_Bourgogne_bottles = 0
    @user_Loire_bottles = 0
    @user_Espagne_bottles = 0
    @user_Champagne_bottles = 0
    @user_Normandie_bottles = 0
    @user_Sud_ouest_bottles = 0
    @user_Italie_bottles = 0
    @user_France_bottles = 0
    @user_Savoie_bottles = 0
    @user_Provence_bottles = 0
    @user_Rhône_bottles = 0
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
      elsif bottle.region.name == 'Bourgogne'
        @user_Bourgogne_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Loire'
        @user_Loire_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Savoie'
        @user_Savoie_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Espagne'
        @user_Espagne_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Champagne'
        @user_Champagne_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Normandie'
        @user_Normandie_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Sud ouest'
        @user_Sud_ouest_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'Italie'
        @user_Italie_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      elsif bottle.region.name == 'France'
        @user_France_bottles += UserBottle.find_by(bottle_id: bottle.id).quantity
      end
    end
    @all_bottles = {
      Bordeaux: @user_bordeaux_bottles,
      Alsace: @user_alsace_bottles,
      Corse: @user_Corse_bottles,
      Provence: @user_Provence_bottles,
      Baujolais: @user_Baujolais_bottles,
      Jura: @user_Jura_bottles,
      Rhône: @user_Rhône_bottles,
      Afrique_du_sud: @user_Afrique_bottles,
      Argentine: @user_Argentine_bottles,
      Languedoc: @user_Languedoc_bottles,
      Roussillon: @user_Roussillon_bottles,
      Chili: @user_Chili_bottles,
      Bourgogne: @user_Bourgogne_bottles,
      Loire: @user_Loire_bottles,
      Savoie: @user_Savoie_bottles,
      Espagne: @user_Espagne_bottles,
      Champagne: @user_Champagne_bottles,
      Normandie: @user_Normandie_bottles,
      Sud_ouest: @user_Sud_ouest_bottles,
      Italie: @user_Italie_bottles,
      France: @user_France_bottles
    }
    @sorted_bottles = @all_bottles.sort_by{|key, value| -value }
  end
end
