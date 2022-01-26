class Employee
  def initialize(attributes = {})
    # id, username, password, role
    @id = attributes[:id]
    @username = attributes[:username]
    @password = attributes[:password]
    @role = attributes[:role]
  end

  def manager?
    @role == 'manager'
  end

  def rider?
    @role == 'rider'
  end
end

# TESTING

employee1 = Employee.new(username: 'bruncky', password: 'secret', role: 'manager')
p employee1
p employee1.manager?
p employee1.rider?
