URL = 'test6.txt'
filepath = File.expand_path(URL, File.dirname(__FILE__))
input_integer = File.read(filepath).split("\n")[0].split(',').map(&:to_i)

def part_one(array, days)
  count = 0
  incrementation(array, count, days)
end

def incrementation(array, count, day)
  new_fish = []
  first_input = []
  array.each do |num|
    if num.positive?
      first_input << num - 1
    else
      first_input << 6
      new_fish << 8
    end
  end
  count += 1
  result = first_input + new_fish
  return result.length if count == day
  incrementation(result, count, day)
end

def part_two(array, days)
  hash = array.tally
  days.times do
    new_fish = Hash.new(0)
    hash.map do |key, value|
      if key.zero?
        new_fish[8] += hash[0]
        new_fish[6] += hash[0]
      else
        new_fish[key - 1 ] += value
      end
    end
    hash = new_fish.clone
  end
  hash.values.sum
end

p part_one(input_integer, 80)

p part_two(input_integer, 256)
