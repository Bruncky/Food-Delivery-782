require_relative 'app/repositories/meals_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customers_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'router'

MEALS_CSV_FILE = File.join(__dir__, 'data/meals.csv')
CUSTOMERS_CSV_FILE = File.join(__dir__, 'data/customers.csv')

meals_repository = MealRepository.new(MEALS_CSV_FILE)
meals_controller = MealsController.new(meals_repository)

customers_repository = CustomerRepository.new(CUSTOMERS_CSV_FILE)
customers_controller = CustomersController.new(customers_repository)

router = Router.new(meals_controller, customers_controller)
router.run
