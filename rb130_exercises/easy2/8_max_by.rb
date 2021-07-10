def max_by(array)
  highest_idx = 0
  current_value = []

  array.each_with_index do |item, idx|
    if current_value[0] == nil || yield(item) > current_value[0]
      current_value[0] = yield(item) 
      highest_idx = idx
    end
  end

  array[highest_idx]
end


p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil