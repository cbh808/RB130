=begin
Write a method that takes an optional block. 
If the block is specified, the method should execute it,
 and return the value returned by the block. 
If no block is specified, 
 the method should simply return the String 'Does not compute.'.

Further Exploration
Modify the compute method so it takes a single argument
 and yields that argument to the block. 
Provide at least 3 examples of calling this new version
 of compute, including a no-block call.
=end

def compute(arg)
  block_given? ? yield(arg) : "Does not compute."
end

p compute(3) {|arg| 5 + 3 + arg} == 11
p compute(:c) {|arg| 'a' + 'b' + arg.to_s } == 'abc'
p compute(3) == 'Does not compute.'

