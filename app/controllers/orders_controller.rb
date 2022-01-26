# require_relative '../views/meals_view'
# require_relative '../views/customers_view'
# require_relative '../views/employees_view'
require_relative '../views/orders_view'

class OrdersController
  def initialize(meals_repository, customers_repository, employees_repository, orders_repository)
    @orders_repository = orders_repository
    @meals_repository = meals_repository
    @customers_repository = customers_repository
    @employees_repository = employees_repository

    # @meals_view = MealsView.new
    # @customers_view = CustomersView.new
    # @employees_view = EmployeesView.new
    @view = OrdersView.new
  end

  def add
    meal = select_element('meal')
    customer = select_element('customer')
    employee = select_element('employee')

    order = Order.new(meal: meal, customer: customer, employee: employee)

    @orders_repository.create(order)
  end

  def list_undelivered_orders
    @view.display(@orders_repository.undelivered_orders)
  end

  def list_my_orders(employee)
    undelivered_orders = @orders_repository.undelivered_orders
    my_orders = undelivered_orders.select { |order| order.employee == employee }

    @view.display(my_orders)
  end

  def mark_as_delivered(employee)
    index = @view.ask_user_for(:index).to_i - 1

    # Using the logic above to get an employees
    # undelivered orders (could be exported to a method!)
    undelivered_orders = @orders_repository.undelivered_orders
    my_orders = undelivered_orders.select { |order| order.employee == employee }

    # Now we use that index to grab the
    # correct UNDELIVERED order from the Array
    order = my_orders[index]

    @orders_repository.mark_as_delivered(order)
  end

  private

  def select_element(stuff)
    index = @view.ask_user_for(:index).to_i - 1

    case stuff
    when 'meal' then @meals_repository.all[index]
    when 'customer' then @customers_repository.all[index]
    when 'employee' then @employees_repository.all_riders[index]
    else puts 'Does not exist'
    end
  end
end
