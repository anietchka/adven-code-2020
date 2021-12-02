require 'net/http'
require 'uri'
url = 'test2.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
counts = Hash.new(0)
file_data.each { |name| counts[name] += 1 }
def first(array)
  horizontal = 0
  vertical = 0
  array.each do |key, value|
    if key[0] == "f"
      (key[-1].to_i * value.to_i)
      horizontal += (key[-1].to_i * value.to_i)
    elsif key[0] == "d"

      vertical += (key[-1].to_i * value.to_i)
    elsif key[0] == "u"
      (key[-1].to_i * value.to_i)
      vertical -= (key[-1].to_i * value.to_i)
    end

  end
  p horizontal * vertical
end
first(counts)
array = file_data.map {|x| x.split(" ")}
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
    p aim
    p x.last.to_i
      depth += x.last.to_i
      horizontal += (x.last.to_i * aim)
    end
  end
  p horizontal * depth
end

second(array)
