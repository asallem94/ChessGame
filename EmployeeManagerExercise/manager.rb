require 'byebug'
require_relative 'employee'
class Manager < Employee
  attr_accessor :tot_labors, :emp_salary

  def initialize(name, salary, title, boss = nil)

    @tot_labors = 0
    @emp_salary = 0
    super
    # update_supervisor
  end

  def bonus(multiplier)
    self.emp_salary * multiplier
  end
  
end
