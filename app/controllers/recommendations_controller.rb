class RecommendationsController < ApplicationController

  def search
    if params[:pairing].present? && params[:color].present? && params[:bio].present? && params[:garder].present?
      redirect_to recommendations_path(pairing: params[:pairing], color: params[:color], bio: params[:bio], garder: params[:garder], price: params[:price])
    end
  end

  def index
    arguments = { pairing: params[:pairing], color: params[:color], bio: params[:bio], garder: params[:garder], price: params[:price] }
    @bottles = RecommendationService.new(arguments).call
    @user_bottle = UserBottle.new
  end
end
