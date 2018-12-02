values = File.readlines('input.txt')
puts values.map{ |x| x.to_i }.reduce(:+)
