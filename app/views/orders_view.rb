class OrdersView
  def ask_user_for(stuff)
    puts "#{stuff}?"
    print '> '

    gets.chomp
  end

  def display(orders)
    orders.each { |order| puts "#{order.meal.name} #{order.customer.name} #{order.employee.username}" }
  end
end
