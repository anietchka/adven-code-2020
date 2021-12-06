# frozen_string_literal: true

require 'net/http'
require 'uri'
url = 'test4.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
random_numbers = file_data.first.split(',')
file_data.slice!(0)
html = []
file_data.each { |x| html << x if x != '' }
all_grids = html.each_slice(5).to_a

def include_in_line_and_replace?(num, line)
  line[line.index(num)] = 'X' if line.include?(num)
end

def verification_line(array)
  array.any? { |line| line == %w[X X X X X] }
end

def verification_collumn(array)
  array.transpose.any? { |line| line == %w[X X X X X] }
end

def split_in_array(grid)
  grid.map { |grid| grid.map { |line| line.split(' ') } }
end

def part_one(grid, numbers)
  all_grid_array = split_in_array(grid)
  numbers.each do |num|
    all_grid_array.each do |grid|
      grid.each do |line|
        include_in_line_and_replace?(num, line)
        next unless verification_line(grid) || verification_collumn(grid)
        left_numbers = 0
        grid.each { |line| line.each { |x| left_numbers += x.to_i if x != 'X' } }
        p left_numbers * num.to_i
        return
      end
    end
  end
end

part_one(all_grids, random_numbers)

def part_two(grid, numbers)
  all_grid_array = split_in_array(grid)
  find_last_winner(numbers,all_grid_array)
end

def find_numbers_not_used(grid, num)
  left_numbers = 0
  grid.each { |line| line.each { |x| left_numbers += x.to_i if x != 'X' } }
  p left_numbers * num.to_i
end

def find_last_winner(numbers,grid_array)
  numbers.each do |num|
    grid_array.each do |grid|
      grid.each do |line|
        include_in_line_and_replace?(num, line)
        if verification_line(grid) || verification_collumn(grid)
          grid_array.slice!(grid_array.index(grid))
          if grid_array.length == 0
            return find_numbers_not_used(grid, num)
          end
          find_last_winner(numbers,grid_array)
        else
          next
        end
        return
      end
    end
  end
end
part_two(all_grids,random_numbers)
