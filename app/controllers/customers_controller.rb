require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customers_repository)
    @customers_repository = customers_repository
    @view = CustomersView.new
  end

  def add
    name = @view.ask_user_for(:name)
    address = @view.ask_user_for(:address)

    customer = Customer.new(name: name, address: address)

    @customers_repository.create(customer)
  end

  def list
    customers = @customers_repository.all

    @view.display(customers)
  end
end
