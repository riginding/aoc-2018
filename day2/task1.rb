values = File.readlines('input.txt')

class BoxId
  def initialize(id)
    @id = id
    @char_count = Hash.new(0)
    id.split('').each do |c|
      @char_count[c] += 1
    end
  end

  def double?
    @char_count.values.include?(2)
  end

  def tripple?
    @char_count.values.include?(3)
  end

  def inspect
    @id
  end
end

class BoxCounter
  def initialize(values)
    @box_ids = values.map do |v|
      BoxId.new(v)
    end
  end

  def double
    @box_ids.select do |box_id|
      box_id.double?
    end.count
  end

  def tripple
    @box_ids.select do |box_id|
      box_id.tripple?
    end.count
  end

  def solve
    double * tripple
  end
end

p BoxCounter.new(values).solve
