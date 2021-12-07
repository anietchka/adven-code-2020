URL = 'test6.txt'
filepath = File.expand_path(URL, File.dirname(__FILE__))
input_integer = File.read(filepath).split("\n")[0].split(',').map(&:to_i)

def part_one(array, days)
  count = 0
  incrimentation(array, count, days)
end

def incrimentation(array, count, day)
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
  incrimentation(result, count, day)
end

p part_one(input_integer, 80)
