subjects = File.readlines('input.txt')
comparisons = subjects.clone

def differs_max_one_position(a, b)
  charA = a.split('')
  charB = b.split('')

  error_count = 0
  charA.each_with_index do |c, index|
    break if error_count > 1
    if charB[index] != c
      error_count += 1
    end
  end

  return error_count == 1
end

def same_chars(a,b)
  charA = a.split('')
  charB = b.split('')
  res = []

  charA.each_with_index do |c, index|
    res.push(c) if c == charB[index]
  end

  return res.join('')
end


res = ''
subjects.each_with_index do |subj, subj_idx|
  comparisons.each_with_index do |comp, comp_idx|
    next if subj_idx <= comp_idx
    if differs_max_one_position(subj, comp)
      res = same_chars(subj, comp)
      break
    end
  end
end

puts res
