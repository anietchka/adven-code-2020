require 'net/http'
require 'uri'
url = 'test5.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
array = file_data.map do |line|
  line.split(' -> ').map do |coordinates|
    coordinates.split(',')
  end
end

def initialize_board(n, val)
  board = Array.new(n)
  n.times do |row_index|
    board[row_index] = Array.new(n)
    n.times do |column_index|
      board[row_index][column_index] = val
    end
  end
  board
end

def x1_and_x2_or_y1_and_y2_equal?(array)
    true if array.first.first == array.last.first || array.first.last == array.last.last
  end

def change_colum(grid, array, index)
  array.each do |i|
    if grid[i][index] == 0
      grid[i][index] = 1
    else
      grid[i][index] = 'X'
    end
  end
end

def change_line(grid, array, index)
  array.each do |i|
    if grid[index][i] == 0
      grid[index][i] = 1
    else
      grid[index][i] = 'X'
    end
  end
end

def change_diagonal_one_sens(grid, line, collumn)
  line.zip(collumn).each do |l, c|
    if grid[l][c] == 0
      grid[l][c] = 1
    else
      grid[l][c] = 'X'
    end
  end
end

def find_all_x(grid)
  result = []
  grid.each do |line|
    result << line.count('X')
  end
  p result.sum
end

def first_part(array)
  grid = initialize_board(1000, 0)
  def regroup_valide_line(result, array)
    array.each { |line| result << line if x1_and_x2_or_y1_and_y2_equal?(line) }
  end

  valid_lines = []
  regroup_valide_line(valid_lines, array)
  valid_lines.each do |line|
    x_start = line.first.first.to_i
    y_start = line.first.last.to_i
    x_end = line.last.first.to_i
    y_end = line.last.last.to_i
    if y_start == y_end
      if x_start > x_end
        range = (x_end..x_start).to_a
        change_line(grid, range, y_start)
      else
        range = (x_start..x_end).to_a
        change_line(grid, range, y_start)
      end
    elsif x_start == x_end
      if y_start > y_end
        range = (y_end..y_start).to_a
        change_colum(grid, range, x_start)
      elsif y_end > y_start
        range = (y_start..y_end).to_a
        change_colum(grid, range, x_start)
      end
    end
  end

  find_all_x(grid)
end

first_part(array)

def second_part(array)
  grid = initialize_board(1000, 0)
  array.each do |line|
    x_start = line.first.first.to_i
    y_start = line.first.last.to_i
    x_end = line.last.first.to_i
    y_end = line.last.last.to_i
    if y_start == y_end
      if x_start > x_end
        range = (x_end..x_start).to_a
        change_line(grid, range, y_start)
      else
        range = (x_start..x_end).to_a
        change_line(grid, range, y_start)
      end
    elsif x_start == x_end
      if y_start > y_end
        range = (y_end..y_start).to_a
        change_colum(grid, range, x_start)
      elsif y_end > y_start
        range = (y_start..y_end).to_a
        change_colum(grid, range, x_start)
      end
    else
      if x_start < x_end && y_start > y_end
        range = (y_end..y_start).to_a
        range_colum = (x_start..x_end).to_a.reverse
        change_diagonal_one_sens(grid, range, range_colum)
      elsif x_start > x_end && y_start < y_end
        range = (y_start..y_end).to_a
        range_colum = (x_end..x_start).to_a.reverse
        change_diagonal_one_sens(grid, range, range_colum)
      elsif x_start < x_end && y_start < y_end
        range = (y_start..y_end).to_a
        range_colum = (x_start..x_end)
        change_diagonal_one_sens(grid, range, range_colum)
      elsif x_start > x_end && y_start > y_end
        range = (y_end..y_start).to_a
        range_colum = (x_end..x_start)
        change_diagonal_one_sens(grid, range,range_colum)
      end
    end
  end
  find_all_x(grid)
end

second_part(array)
