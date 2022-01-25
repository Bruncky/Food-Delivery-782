require_relative '../views/customer_view'
require_relative '../models/customer'

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @view = CustomerView.new
  end

  def add
    name = @view.ask_user_for(:name)
    address = @view.ask_user_for(:address)

    customer = Customer.new(name: name, address: address)

    @customer_repository.create(customer)
  end

  def list
    customers = @customer_repository.all

    @view.display(customers)
  end
end
