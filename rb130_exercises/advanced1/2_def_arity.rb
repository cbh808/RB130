# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }

puts my_proc         #<Proc:0x00007fc7a107ea20 2_def_arity.rb:2>
puts my_proc.class   # Proc
my_proc.call         # This is a .
my_proc.call('cat')  # This is a cat.
 
=begin
my_proc is referencing a Proc object.
This is confirmed with `puts my_proc` and `puts my_proc.class`.
When calling `my_proc.call`, no agument was passed to the block. Arity rules of procs are that missing arguments are set to `nil`. This can be confirmed in the output `This is a .`. 
my_proc.call('cat') provides an argument and the block uses it accordingly.
=end

puts "========= group 2 ========="

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
my_lambda.call
my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

=begin
First to notice is that three different ways of defining a lambda are demonstrated.
Secondly the object defined as a lambda is also of the Proc class, but with secondary designation in parenthesis of (lambda)
Arity rules of lambdas require that the correct number of arguments are passed to the block, otherwise an ArgumentError is raised.
=end

puts "========= group 3 ========="

# # Group 3
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}."}
block_method_1('seal')

=begin
In the block method_1, the `yield` call does not include an argument to be passed into the block.
No error is raised, and a value of `nil` is assigned to `seal`. 
In the second call a LocalJumpError is called because `yield` expects to find a block passed in at method invocation but cannot locate one. 
When a method contains `yield` a block must be passed in at method invocation. 
=end

puts "========= group 4 ========="

# Group 4
def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end
block_method_2('turtle') { puts "This is a #{animal}."}

=begin
In group 4, an argument is passed into the method at invocation and a block as well.
The method accepts the argument and passes it owards as an argument to `yield`.
In each case the arguments of `yield` are passed to the block as values assigned as local variables to the variables defined as block parameters that can subsequently be used within the block. If the correct number of arguments are not passed to the block, then the local variables are assigned values of `nil`. Arity rules for yield do not raise an error.
In block_method2, the local variable `animal` was never initialized and a NameError is raised. 


final: arity differences occur between block, procs, and lambdas.
lambdas are the only one that require the correct number of arguments at method invokation.
blocks are required to be provided at method invocation if the method yields to a block.
the number of block paramaters and the number of arguments passed in a yield are not relevant and will not raise errors. 
parameters defined at method definition for which arguments are not passed at method invocation result in block variables  being assigned a value of `nil`


=end

