require "employee"

class Startup

    attr_reader :name, :funding, :salaries, :employees

    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(another_startup)
        self.funding > another_startup.funding
    end

    def hire(employee_name, title)
        if self.valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "not valid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if self.funding >= salary
            employee.pay(salary)
            @funding -= salary
        else 
            raise "not enough funding"
        end
    end

    def payday
       employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        total_salary = 0

        employees.each do |employee|
            total_salary += @salaries[employee.title]
        end

        total_salary / self.size
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(another_startup)
        @funding += another_startup.funding
        another_startup.salaries.each do |title, amount|
            if !@salaries.has_key?(title)
                @salaries[title] = amount
            end
        end
        @employees += another_startup.employees
        another_startup.close
    end



end
