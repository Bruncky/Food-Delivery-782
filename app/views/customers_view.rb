class CustomersView
  def ask_user_for(stuff)
    puts "#{stuff}?"
    print '> '

    gets.chomp
  end

  def display(customers)
    customers.each { |customer| puts "#{customer.name} 🏡 #{customer.address}" }
  end
end
