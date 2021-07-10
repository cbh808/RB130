fac = Enumerator.new do |y|
  n = 0
  loop do
    y << factorial(n) # yield(factorial(n))
    n += 1
  end
end

def factorial(n)
  return 1  if n == 0
  (1..n).reduce(1, :*)
end

p fac.take(1)
p fac.take(2)
p fac.take(3)
p fac.take(7)
puts "=========================="
# External iterators

6.times { |number| puts "#{number}! == #{fac.next}" }
puts "=========================="
3.times { |number| puts "#{number}! == #{fac.next}" }
puts "=========================="
fac.rewind
6.times { |number| puts "#{number}! == #{fac.next}" }
puts "=========================="

# Internal iterators

fac.each_with_index do |value, number|
  puts "#{number}! == #{value}"
  break if number >= 5
end