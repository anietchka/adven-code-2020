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
  count_mean = 0
  count_mean_min = 0
  count_mean_max = 0
  mean = mean(array).round
  array.each do |num|
    count_mean += increase(num, mean)
    count_mean_min += increase(num, mean - 1)
    count_mean_max += increase(num, mean - 2)
  end
  [count_mean, count_mean_min, count_mean_max].min
end

p part_two(input_integer)
# irb
# require 'mon_fichier'
# App.new("input.txt").run

class App

  def initialize(file)
    @crew = Open.file(file) # parse
  end

  def run
    CrabCrew.new(@crew).least_fuel
  end
end

class CrabCrew
  def initialize(crew)
    @crew = crew
  end

  def least_fuel
    position = {}
    (min..max).each do |p|
      position[p] = @crew.map do |crab_position|
        difference = (p - crab_position).abs
        difference*(difference-1)/2
      end.sum
    end

    return position.values.min
  end

  private

  def min
    @crew.min
  end

  def max
    @crew.max
  end

end
