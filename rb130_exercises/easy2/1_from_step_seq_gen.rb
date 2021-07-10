def step(first, last, step)
  counter = first

  until counter > last
    yield(counter)
    counter += step
  end

  [first, last, step]
end

p step(1, 10, 3) { |value| puts "value = #{value}" }