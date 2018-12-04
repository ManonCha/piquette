require 'date'

def drink_recommendation_service
  class << self
    def initialize(arguments)
      @color = arguments.color
      @meal = arguments.meal
      @type = arguments.type
      @price = arguments.price
    end

    def call
      year = Date.today.year
      Bottle.where(color: @color, meal: @meal, type: @type, price: < @price).take(15)
    end
  end
end

