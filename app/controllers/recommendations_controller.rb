class RecommendationsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:search, :index]

  def search

  end

  def index

  end
end
