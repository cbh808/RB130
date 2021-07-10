=begin
Algorithm:

iterate over array
pass in current value to the block
if return value of block `false`, return `false` for method
if r.v. `true`, go to next element of array
if no elements cause block to evaluate to `false`, return `true`
ensure that if array empty?, returns `true`
=end

def all?(array, &block)
  array.each { |n| return false if !block.call(n) }
  true
end

p all?([1, 3, 5, 6]) { |value| value.odd? } == false
p all?([1, 3, 5, 7]) { |value| value.odd? } == true
p all?([2, 4, 6, 8]) { |value| value.even? } == true
p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
p all?([1, 3, 5, 7]) { |value| true } == true
p all?([1, 3, 5, 7]) { |value| false } == false
p all?([]) { |value| false } == true