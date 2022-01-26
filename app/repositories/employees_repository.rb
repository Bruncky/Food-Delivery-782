require 'csv'

require_relative '../models/employee'

class EmployeesRepository
  def initialize(csv_file_path)
    @csv_file = csv_file_path
    @employees = []

    @next_id = 1

    load_csv if File.exist?(csv_file_path)
  end

  def all_riders
    @employees.select { |employee| employee.rider? }
  end

  def all
    @employees
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  private

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w[id username password role]

      @employees.each do |employee|
        csv << [employee.id, employee.username, employee.password, employee.role]
      end
    end
  end

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }

    CSV.foreach(@csv_file, **csv_options) do |row|
      row[:id] = row[:id].to_i

      @employees << Employee.new(row)
    end

    @next_id = @employees.last.id + 1 unless @employees.empty?
  end
end
