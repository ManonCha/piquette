require 'date'

class RecommendationService
  def initialize(arguments)
    @color = arguments[:color]
    @pairing = arguments[:pairing]
    @bio = arguments[:bio]
    @garder = arguments[:garder]
  end

  def call
    year = Date.today.year

    if @color == 'all'
      @bottles_color = Bottle.all
    else
      @bottles_color = Bottle.joins(:color).where(colors: { name: @color })
    end

    if @bio != 'all'
      @bottles_bio = @bottles_color.where(bio: @bio)
    else
      @bottles_bio = @bottles_color.all
    end

    @bottles_bio.map do |b|
      b if b.wine_pairing.to_s.split.include?(@pairing)
    end

    if @garder == 'false'
      @bottles_bio.where('best_before < ?', year).where('best_after > ?', year)
    elsif @garder == 'true'
      @bottles_bio.where('best_before > ?', year)
    else
      @bottles_bio
    end
  end
end
