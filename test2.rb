# frozen_string_literal: true

require 'net/http'
require 'uri'
url = 'test2.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
array = file_data.map { |x| x.split(' ') }
def first(array)
  horizontal = 0
  depth = 0
  array.each do |x|
    case x.first[0]
    when 'd'
      depth += x.last.to_i
    when 'u'
      depth -= x.last.to_i
    when 'f'
      horizontal += x.last.to_i
    end
  end
  p horizontal * depth
end
first(array)
def second(array)
  aim = 0
  horizontal = 0
  depth = 0
  array.each do |x|
    case x.first[0]
    when 'd'
      aim += x.last.to_i
    when 'u'
      aim -= x.last.to_i
    when 'f'
      depth += x.last.to_i
      horizontal += (x.last.to_i * aim)
    end
  end
  p horizontal * depth
end

second(array)
