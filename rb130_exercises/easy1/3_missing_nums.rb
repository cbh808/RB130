=begin
Problem:Write a method that takes a sorted array 
of integers as an argument
and returns an array that includes all of the 
missing integers (in order) between the first 
and last elements of the argument.
E:
# missing([1, 5]) == [2, 3, 4]
Data Structures:
input: Array 
output: Array
Algorithm:
iterate over array from index 0 to index -2
  starting idx = 0
  ending idx = array.size - 2

compare values in pairs and find difference
  subtract first value from second = n
from 1 to n-1, append value 1 + n to result array

return result


=end

# def missing(arr)
#   result = []
#   i = arr.length - 1

#   i.times do |idx|
#     n = (arr[idx+1] - arr[idx]) - 1
#     (1..n).each do |num|
#       result << arr[idx] + num
#     end
#   end
#   result
# end

def missing(arr)
  (arr.min..arr.max).to_a - arr
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []
