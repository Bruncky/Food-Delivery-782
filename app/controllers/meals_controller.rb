require_relative '../views/meal_view'
require_relative '../models/meal'

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @view = MealsView.new
  end

  def add
    name = @view.ask_user_for(:name)
    price = @view.ask_user_for(:price).to_i

    meal = Meal.new(name: name, price: price)

    @meal_repository.create(meal)
  end

  def list
    meals = @meal_repository.all

    @view.display(meals)
  end
end
