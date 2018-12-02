values = File.readlines('input.txt').map { |x| x.to_i }

def find_double_frequencies(values)
  seen_frequencies = {}
  frequency = 0
  iteration = 0

  loop do
    change = values[iteration % values.length]
    frequency = frequency + change
    if (seen_frequencies[frequency] == true)
      return frequency
    end
    seen_frequencies[frequency] = true
    iteration = iteration + 1
  end
end

puts find_double_frequencies(values)