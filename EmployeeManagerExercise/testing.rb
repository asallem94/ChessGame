require_relative "manager"

ned = Manager.new("Ned", 1000000, "Founder")
darren = Manager.new("Darren", 78000, "TA Manager", ned)
shawna = Employee.new("Shawna", 12000, "TA", darren)
david = Employee.new("David", 10000, "TA", darren)

puts ned.bonus(5) # => 500_000
puts darren.bonus(4) # => 88_000
puts david.bonus(3) # => 30_000
