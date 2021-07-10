require 'set'

def map(arr)
  result = []
  arr.each { |n| result << yield(n)}
  result
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { |value| true } == []
p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

# Further Exploration
# hash => also works
puts '=== hash ==='
p map({a:1, b:3, c:5, d:6}) { | _, value| value * 2 } == [2, 6, 10, 12]
# set => also works
puts '=== set ==='
p map([1, 3, 5, 6].to_set) { |value| value * 2 } == [2, 6, 10, 12]
