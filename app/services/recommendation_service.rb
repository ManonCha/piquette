require 'date'

class RecommendationService
  def initialize(arguments)
    @color = arguments[:color]
    @pairing = arguments[:pairing]
    @bio = arguments[:bio]
    @garder = arguments[:garder]
    @price = arguments[:price]
  end

  def call
    year = Date.today.year

    @bottles = Bottle.all

    if @color != 'all'
      @bottles = @bottles.joins(:color).where(colors: { name: @color })
    end

    if @bio != 'all'
      @bottles = @bottles.where(bio: @bio)
    end

    @bottles = @bottles.where("wine_pairing @@ ?", "%#{@pairing}%")

    @bottles = @bottles.where('price <= ?', @price)

    if @garder == 'false'
      @bottles = @bottles.where('best_before > ?', year).where('best_after <= ?', year)
    elsif @garder == 'true'
      @bottles = @bottles.where('best_before > ?', year + 5)
    end
    @bottles
  end
end

