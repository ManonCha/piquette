require 'date'

def drink_recommendation_service
  class << self
    def initialize(arguments)
      @color = arguments.color
      @meal = arguments.meal
      @type = arguments.type
    end

    def call
      year = Date.today.year
      Bottle.where(color: @color, meal: @meal, type: @type, best_before: >= year, best_after: <= year).take(5)
    end
  end
end


