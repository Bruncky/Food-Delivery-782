require_relative 'app/repositories/employees_repository'
require_relative 'app/controllers/sessions_controller'

require_relative 'app/repositories/meals_repository'
require_relative 'app/controllers/meals_controller'

require_relative 'app/repositories/customers_repository'
require_relative 'app/controllers/customers_controller'

require_relative 'router'

MEALS_CSV_FILE = File.join(__dir__, 'data/meals.csv')
CUSTOMERS_CSV_FILE = File.join(__dir__, 'data/customers.csv')
EMPLOYEES_CSV_FILE = File.join(__dir__, 'data/employees.csv')

employees_repository = EmployeesRepository.new(EMPLOYEES_CSV_FILE)
sessions_controller = SessionsController.new(employees_repository)

meals_repository = MealsRepository.new(MEALS_CSV_FILE)
meals_controller = MealsController.new(meals_repository)

customers_repository = CustomersRepository.new(CUSTOMERS_CSV_FILE)
customers_controller = CustomersController.new(customers_repository)

router = Router.new(meals_controller, customers_controller, sessions_controller)
router.run
