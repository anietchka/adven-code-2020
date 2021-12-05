# frozen_string_literal: true

require 'net/http'
require 'uri'
url = 'test1.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
input_integer = file_data.map {|num| num.to_i}

def larger(array)
  result = []
  array.each_with_index do |element, index|
    result << element if index.positive? && element > array[index - 1]
  end
  p result.length
end
larger(input_integer)

def part_two(array)
  new_array = []
  array.each_with_index do |element, index|
    new_array << [element, array[index + 1].to_i, array[index + 2].to_i].sum
  end
  new_array
end

larger(part_two(input_integer))
