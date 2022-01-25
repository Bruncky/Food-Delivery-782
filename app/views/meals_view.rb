class MealsView
  def ask_user_for(stuff)
    puts "#{stuff}?"
    print '> '

    gets.chomp
  end

  def display(meals)
    meals.each { |meal| puts "#{meal.name} 💵 #{meal.price}" }
  end
end
