require 'net/http'
require 'uri'
url = 'test3.txt'
file = File.open(url)
file_data = file.readlines.map(&:chomp)
array = file_data.map do |n|
  n.split("")
end
array

def dispatch(var, array, num)
  array.each do |n|
    var << n[num]
  end
  var
end

def hash(array)
  counts = Hash.new(0)
  array.each { |name| counts[name] += 1 }
  counts
end

def compare(hash, array1, array2, num)
  if hash["1"] >= hash["0"]
    array1.each do |n|
      if  n[num] == "1"
        array2 << n
      end
    end
  else
    array1.each do |n|
      if  n[num] == "0"
        array2 << n
      end
    end
  end
  array2
end
a = []
b = []
c = []
d = []
e = []
f = []
g = []
h = []
i = []
j = []
first = []
second = []
three = []
four = []
five = []
six = []
seven = []
heigt = []
nine = []
ten = []

a = dispatch(a, file_data, 0)
p hash(a)
a = compare(hash(a), file_data, first, 0)
b = dispatch(b, a, 1)
p hash(b)
b = compare(hash(b), first, second, 1)
c = dispatch(c, b, 2)
p hash(c)
c = compare(hash(c), second, three, 2)
p hash(dispatch(d, c, 3))
d = compare(hash(dispatch(d, c, 3)), three, four, 3)
p hash(dispatch(e, d, 4))
e = compare(hash(dispatch(e, d, 4)), four, five, 4)
p hash(dispatch(f, e, 5))
f = compare(hash(dispatch(f, e, 5)), five, six, 5)
p hash(dispatch(g, f, 6))
g = compare(hash(dispatch(g, f, 6)), six, seven, 6)
p hash(dispatch(h, g, 7))
h = compare(hash(dispatch(h, g, 7)), seven, heigt, 7)
p hash(dispatch(i, h, 8))
i = compare(hash(dispatch(i, h, 8)), heigt, nine, 8)
p hash(dispatch(j, i, 9))
p j = compare(hash(dispatch(j, i, 9)), nine, ten, 9)

p "001100111001".to_i(2) * "110100101111".to_i(2)


def compare_minus(hash, array1, array2, num)
  if hash["1"] >= hash["0"]
    array1.each do |n|
      if  n[num] == "0"
        array2 << n
      end
    end
  else
    array1.each do |n|
      if  n[num] == "1"
        array2 << n
      end
    end
  end
  array2
end
a = []
b = []
c = []
d = []
e = []
f = []
g = []
h = []

first = []
second = []
three = []
four = []
five = []
six = []
seven = []
heigt = []

a = dispatch(a, file_data, 0)
p hash(a)
a = compare_minus(hash(a), file_data, first, 0)
b = dispatch(b, a, 1)
p hash(b)
b = compare_minus(hash(b), first, second, 1)
c = dispatch(c, b, 2)
p hash(c)
c = compare_minus(hash(c), second, three, 2)
p hash(dispatch(d, c, 3))
d = compare_minus(hash(dispatch(d, c, 3)), three, four, 3)
p hash(dispatch(e, d, 4))
e = compare_minus(hash(dispatch(e, d, 4)), four, five, 4)
p hash(dispatch(f, e, 5))
f = compare_minus(hash(dispatch(f, e, 5)), five, six, 5)
p hash(dispatch(g, f, 6))
g = compare_minus(hash(dispatch(g, f, 6)), six, seven, 6)
p hash(dispatch(h, g, 7))
p h = compare_minus(hash(dispatch(h, g, 7)), seven, heigt, 7)
#  file_data.each do |n|
#    a << n[0]
#    b << n[1]
#    c << n[2]
#    d << n[3]
#    e << n[4]
#    f << n[5]
#    g << n[6]
#    h << n[7]
#    i << n[8]
#    j << n[9]
#    k << n[10]
#    l << n[11]
#  end
#  def hash(array)
#    counts = Hash.new(0)
#    array.each { |name| counts[name] += 1 }
#    counts
#  end
#  p hash(a)
#  p hash(b)
#  p hash(c)
#  p hash(d)
#  p hash(e)
#  p hash(f)
#  p hash(g)
#  p hash(h)
#  p hash(i)
#  p hash(j)
#  p hash(k)
#  p hash(l)
#  most = []
#  min = []
#  first = []
#  second = []
#  three = []
#  four = []
#  five = []
#  six = []
#  seven = []
#  heigt = []
#  nine = []
#  ten = []
#  if hash(a)["1"]>hash(a)["0"]
#    file_data.each do |n|
#      if  n[0] == "1"
#        first << n
#      end
#    end
#    most << 1
#    min << 0
#  else
#    file_data.each do |n|
#      if  n[0] == "0"
#        first << n
#      end
#    end
#    most << 0
#    min << 1
#  end
#  if hash(b)["1"]>hash(b)["0"]
#    first.each do |n|
#      if  n[1] == "1"
#        second << n
#      end
#    end
#    most << 1
#    min << 0
#  else
#    first.each do |n|
#      if  n[1] == "0"
#        second << n
#      end
#    end
#    most << 0
#    min << 1
#  end
#
#  if hash(c)["1"]>hash(c)["0"]
#    second.each do |n|
#      if  n[2] == "1"
#        three << n
#      end
#    end
#    most << 1
#    min << 0
#    else
#    second.each do |n|
#      if  n[2] == "0"
#        three << n
#      end
#    end
#    most << 0
#    min << 1
#  end
#
#  if hash(d)["1"]>hash(d)["0"]
#    three.each do |n|
#      if  n[3] == "1"
#        four << n
#      end
#    end
#      most << 1
#      min << 0
#    else
#    three.each do |n|
#      if  n[3] == "0"
#        four << n
#      end
#    end
#      most << 0
#      min << 1
#  end
#
#  if hash(e)["1"]>hash(e)["0"]
#    four.each do |n|
#      if  n[4] == "1"
#        five << n
#      end
#    end
#      most << 1
#      min << 0
#    else
#      four.each do |n|
#      if  n[4] == "0"
#        five << n
#      end
#    end
#      most << 0
#      min << 1
#  end
#
#  if hash(f)["1"]>hash(f)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  if hash(g)["1"]>hash(g)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  if hash(h)["1"]>hash(h)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  if hash(i)["1"]>hash(i)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  if hash(j)["1"]>hash(j)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  if hash(k)["1"]>hash(k)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  if hash(l)["1"]>hash(l)["0"]
#      most << 1
#      min << 0
#    else
#      most << 0
#      min << 1
#  end
#  p most.join().to_i(2) * min.join().to_i(2)
#  p min.join().to_i(2)
#
