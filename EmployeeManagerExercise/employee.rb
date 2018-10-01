class Employee
#   attr_reader :name, :title
  attr_reader :boss, :salary, :name

  def initialize(name, salary, title, boss = nil)
    @name = name
    @salary = salary
    @title = title
    @boss = boss

    update_supervisor
  end

  def bonus(multiplier)
    self.salary * multiplier
  end
  def update_boss_superciser_info(employee_salary)
    unless boss.nil?
    
      boss.emp_salary += employee_salary
      boss.tot_labors += 1
      boss.update_boss_superciser_info(employee_salary)
    end
  end
  def update_supervisor
    unless boss.nil?
      self.boss.tot_labors += 1
      self.boss.emp_salary += salary
      self.boss.update_boss_superciser_info(self.salary)
    end

  end

end
