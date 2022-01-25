require_relative '../views/meals_view'
require_relative '../models/meal'

class MealsController
  def initialize(meals_repository)
    @meals_repository = meals_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_user_for(:name)
    price = @view.ask_user_for(:price).to_i

    meal = Meal.new(name: name, price: price)

    @meals_repository.create(meal)
  end

  def list
    meals = @meals_repository.all

    @view.display(meals)
  end
end
