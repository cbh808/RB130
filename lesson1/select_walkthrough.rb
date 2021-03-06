def select(array)
  result = []
  count = 0
  while count < array.size
    element = array[count]
    result << element if yield(element)
    count += 1
  end

  result
end


array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1}

