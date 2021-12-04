require 'net/http'
require 'uri'
url = 'test5.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
