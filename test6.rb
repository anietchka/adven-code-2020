require 'net/http'
require 'uri'
url = 'test6.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
input_integer = file_data.map {|num| num.split(',').map(&:to_i) }.first

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
