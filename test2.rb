require 'net/http'
require 'uri'
url = 'test2.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
array = file_data.map {|x| x.split(" ")}
def first(array)
  horizontal = 0
  depth = 0
  array.each do |x|
    if x.first[0] == "d"
      depth += x.last.to_i
    elsif x.first[0] == "u"
      depth -= x.last.to_i
    elsif x.first[0] == "f"
      horizontal += x.last.to_i
    end
  end
  p horizontal * depth
end
first(array)
def second (array)
  aim = 0
  horizontal = 0
  depth = 0
  array.each do |x|
    if x.first[0] == "d"
      aim += x.last.to_i
    elsif x.first[0] == "u"
      aim -= x.last.to_i
    elsif x.first[0] == "f"
      depth += x.last.to_i
      horizontal += (x.last.to_i * aim)
    end
  end
  p horizontal * depth
end

second(array)
