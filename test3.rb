require 'net/http'
require 'uri'
url = 'test3.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
array = file_data.map {|x| x.split(" ")}
