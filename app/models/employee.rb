class Employee
  attr_reader :id, :username, :password

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
