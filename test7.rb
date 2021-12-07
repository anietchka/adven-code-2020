# frozen_string_literal: true

URL = 'test7.txt'
filepath = File.expand_path(URL, File.dirname(__FILE__))
input_integer = File.read(filepath).split("\n")[0].split(',').map(&:to_i)
input_integer.sort
def median(array)
  a = array.sort
  elements = a.count
  center = elements / 2
  elements.even? ? (a[center] + a[center - 1]) / 2 : a[center]
end

def part_one(array)
  count = 0
  median(array)
  array.each do |num|
    count += num > median(array) ? num - median(array) : median(array) - num
  end
  count
end

p part_one(input_integer)

def mean(arr)
  arr.inject(0.0) { |sum, el| sum + el } / arr.size
end

def increase(first_num, last_num)
  count = 0
  array = if last_num > first_num
            (first_num..last_num).to_a
          else
            (last_num..first_num).to_a
          end
  array.each do |num|
    count += array.index(num)
  end
  count
end

def part_two(array)
  count = 0
  p mean = mean(array).to_i
  array.each do |num|
    count += increase(num, mean)
  end
  count
end

p part_two(input_integer)
