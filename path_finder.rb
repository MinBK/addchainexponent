require_relative './exponent_path_finder'

puts 'Enter the exponent for which you will like to find path and cost'
power = gets
power = power.to_i

if power < 1
  puts 'power should be greater than 0'
else
  exponent_path_finder = ExponentPathFinder.new(power)
  exponent_path_finder.shortest_path

  route = exponent_path_finder.shortest_route.map{|path| "X#{path}"}.join(',')
  puts "The total cost is #{exponent_path_finder.cost} and shortest path is [#{route}]"
end