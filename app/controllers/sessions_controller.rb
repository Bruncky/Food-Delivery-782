require_relative '../views/sessions_view'

class SessionsController
  def initialize(employees_repository)
    @employees_repository = employees_repository
    @view = SessionsView.new
  end

  def sign_in
    # 1. Ask user for
    username = @view.ask_user_for(:username)

    # 2. Ask user for password
    password = @view.ask_user_for(:password)

    # 3. Find user by username
    employee = @employees_repository.find_by_username(username)

    # 4. Match the password
    if employee && employee.password == password
      @view.valid_credentials(username)
      employee
    else
      @view.invalid_credentials
      sign_in    # RECURSIVE CALL
    end
  end
end
