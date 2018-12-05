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
    @bottles = Bottle.joins(:color).where(colors: { name: @color })
    # @bottles = Bottle.all
  end
end
