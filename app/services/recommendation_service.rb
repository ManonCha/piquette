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

    @bottles = Bottle.all



    # @bottles_color = Bottle.joins(:color).where(colors: { name: @color })

    # if @bio != 'all'
    #   @bottles_bio = @bottles_color.where(bio: @bio)
    # else
    #   @bottles_bio = @bottles_color.all
    # end


  end
end
