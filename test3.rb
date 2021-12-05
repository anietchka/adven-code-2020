# frozen_string_literal: true

require 'net/http'
require 'uri'
url = 'test3.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
array = file_data.map do |n|
  n.split('')
end

def convert_binary_to_decimal(array)
  array.join.to_i(2)
end

def part_one(array)
  result_binary_larger = []
  result_binary_smaller = []
  array.each do |line|
    ones = 0
    zeros = 0
    line.each do |num|
      num == '1' ? ones += 1 : zeros += 1
    end
    if ones > zeros
      result_binary_larger << '1'
      result_binary_smaller << '0'
    else
      result_binary_larger << '0'
      result_binary_smaller << '1'
    end
  end
  p convert_binary_to_decimal(result_binary_larger) * convert_binary_to_decimal(result_binary_smaller)
end
collumn = array.transpose
part_one(collumn)

def part_two(array)
  oxygen_generator_rating(array, 0) * cO2_scrubber_rating(array, 0)
end

def oxygen_generator_rating(grid, index)
  collumn = grid.transpose
  ones = 0
  zeros = 0
  first_match = []
  collumn[index].each { |num| num == '1' ? ones += 1 : zeros += 1 }
  if ones >= zeros
    grid.each { |line| first_match << line if line[index] == '1' }
  else
    grid.each { |line| first_match << line if line[index] == '0' }
  end
  index += 1
  return first_match.first.join.to_i(2) if first_match.length == 1

  oxygen_generator_rating(first_match, index)
end

def cO2_scrubber_rating(grid, index)
  collumn = grid.transpose
  ones = 0
  zeros = 0
  first_match = []
  collumn[index].each { |num| num == '1' ? ones += 1 : zeros += 1 }
  if ones >= zeros
    grid.each { |line| first_match << line if line[index] == '0' }
  else
    grid.each { |line| first_match << line if line[index] == '1' }
  end
  index += 1
  return first_match.first.join.to_i(2) if first_match.length == 1

  cO2_scrubber_rating(first_match, index)
end
p part_two(array)
