# frozen_string_literal: true
url = 'test9.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
input_integer = file_data.map { |num| num.split('').map(&:to_i) }

def part_one(array)
  result = 0
  array.each_with_index do |line, index|
    if index == 0
      line.each_with_index do |num, i|
        if i == 0
          result += num + 1 if num < line[i+1] && num < array[index+1][i]
        elsif i == line.length - 1
          result += num + 1 if num < line[i-1] && num < array[index+1][i]
        else
          result += num + 1 if num < line[i-1] && num < line[i+1] && num < array[index+1][i]
        end
      end
    elsif index == (array.length - 1)
      line.each_with_index do |num, i|
        if i == 0
          result += num + 1 if num < line[i+1] && num < array[index-1][i]
        elsif i == line.length - 1
          result += num + 1 if num < line[i-1] && num < array[index-1][i]
        else
          result += num + 1 if num < line[i-1] && num < line[i+1] && num < array[index-1][i]
        end
      end
    else
      line.each_with_index do |num, i|
        if i == 0
          result += num + 1 if num < line[i+1] && num < array[index+1][i] && num < array[index-1][i]
        elsif i == line.length - 1
          result += num + 1 if num < line[i-1] && num < array[index+1][i] && num < array[index-1][i]
        else
          result += num + 1 if num < line[i-1] && num < line[i+1] && num < array[index+1][i] && num < array[index-1][i]
        end
      end
    end
  end
  p result
end

part_one(input_integer)
