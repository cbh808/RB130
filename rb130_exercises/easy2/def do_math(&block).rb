def do_math(&block)
  2.times { block.call } if block_given?
end

num = 2
do_math { num += 2 }
p num # => 6

num = 0
do_math { num -= 1 }
p num  # => -2

num = 0
do_math
p num  # => 0

num = 6
do_math
p num  # => 6
