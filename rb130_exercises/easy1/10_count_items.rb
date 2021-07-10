=begin
Write method that takes array argument, 
and a block that returns true or false depending on value of array element passed to it.
Method should return a count of number of times block returns true.
You may not use Array#count or Enumerable#count in solution.

Algorithm:
pass array and block to method
initialize counter to 0
iterate over elements of array
increment counter each time block evaluates to true
return value of counter
=end

def count(array)
  counter = 0

  array.each do |n|
    counter += 1 if yield(n)
  end

  counter
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
count(%w(Four score and seven)) { |value| value.size == 5 } == 2
