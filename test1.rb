require 'net/http'
require 'uri'
def larger(array)
  result = []
  array.each_with_index do |element, index|
      if index != 0 && array[index] > array[index-1]
          result << element
      end
  end
  puts result.length + 1
end

def part_two(array)
  new_array = []
  array.each_with_index do |element, index|
    new_array << (array[index].to_i + array[index+1].to_i + array[index+2].to_i)
  end
  p new_array
end

url = "test1.txt"
file = File.open(url)
file_data = file.readlines.map(&:chomp)

larger(part_two(file_data))
