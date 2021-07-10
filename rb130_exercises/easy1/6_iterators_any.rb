=begin
Problem:
Write a method called any? 
It should take an Array as an argument, and a block. 
It should return true if block returns true for any element. 
otherwise, it should return false.
Method to stop processing elements of Array as soon as block returns true.
If Array empty, any? to return false, regardless of how block is defined.
Method may not use any standard ruby named all?, any?, none?, or one?.
Example:
p any?([1, 3, 5, 6]) { |value| value.even? } == true

Data Structures
input: array, block
output: boolean

Algorithm:
if array empty?, return `false`
iterate over array
pass in current value to the block
if return value of block `true`, return `true` for method
if r.v. `false`, go to next element of array
if no elements cause block to evaluate to `true`, return `false`
=end
require 'set'

def any?(array, &block)
  array.each { |n| return true if block.call(n) }
  false
end

p any?([1, 3, 5, 6]) { |value| value.even? } == true
p any?([1, 3, 5, 7]) { |value| value.even? } == false
p any?([2, 4, 6, 8]) { |value| value.odd? } == false
p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
p any?([1, 3, 5, 7]) { |value| true } == true
p any?([1, 3, 5, 7]) { |value| false } == false
p any?([]) { |value| true } == false

# Further
# hash
p any?({a:1, b:3, c:5, d:6}) { | _, value| value.even? } == true
# set
p any?([1, 3, 5, 6].to_set) { |value| value.even? } == true
