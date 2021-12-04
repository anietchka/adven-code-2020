# frozen_string_literal: true

require 'net/http'
require 'uri'
url = 'test4.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
random_umbers = file_data.first.split(',')
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

def verification_collumn(array, index)
  array.all? { |line| line[index] == 'X' }
end

all_grid_array = all_grids.map { |grid| grid.map { |line| line.split(' ') } }
random_umbers.each do |num|
  all_grid_array.each do |grid|
    grid.each do |line|
      include_in_line_and_replace?(num, line)
      next unless verification_line(grid) || verification_collumn(grid,
                                                                  0) || verification_collumn(grid,
                                                                                             1) || verification_collumn(grid,
                                                                                                                        2) || verification_collumn(
                                                                                                                          grid, 3
                                                                                                                        ) || verification_collumn(
                                                                                                                          grid, 4
                                                                                                                        )

      left_numbers = 0
      grid.each { |line| line.each { |x| left_numbers += x.to_i if x != 'X' } }
      p left_numbers * num.to_i
      return
    end
  end
end
