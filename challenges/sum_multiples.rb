=begin
given a natural number and a set of one or more other numbers,
find the sum of all the multiples of the numbers in the set 
that are less than the first number.
If the set of numbers is not given, use a default set of 3 and 5.

Example
all the natural numbers up to, but not including 20 
that are multiples of either 3 or 5: 3, 5, 6, 9, 10, 12, 15, and 18.
The sum of multiples is 78.

input: integer and set of numbers
output: integer, sum of multiples of subset that are lower than num

Test Case
- create class `SumOfMultiples`
- create constructor that takes unknown number of arguments, 
or if none given then default factors are 3 and 5

- create instance method `to` that takes one argument, the max number,
adds up thse sum of all the factors within the range 1..num 

- class method `to` that takes one argument but always has default factors of 3 and 5 

Data Structures:
int inputs
collect multiples in collection
int output

Algorithm
-  constructor that takes unknown number of arguments, 
  - if 1 or more arguments provided (factors), save them to collection (array)
  - if no args given, then default factors are 3 and 5 stored in array

- create instance method `to` that takes one argument, the max number
    create empty array to collect muliples
    iterate from 1 to max number - 1
      if iterator%factor has no remainder then add iterator to collection
    sum all factors and retun the resulting integer

- class method `to` that takes one argument but always has default factors of 3 and 5
        create new SumOfMultiples object
=end

# class SumOfMultiples
#   def initialize(*factors)
#     @factors = (factors.length > 0) ? factors : [3, 5]
#   end

#   def to(num)
#     factors = []
#     [3, 5].each do |fac|
#       i = 1
#       while i < num
#         factors << i if i % fac == 0
#         i += 1
#       end
#     factors
#   end

#   def self.to(num)
    
# end

class SumOfMultiples
  attr_reader :multiples

  def self.to(num)
    SumOfMultiples.new().to(num)
  end

  def initialize(*multiples)
    @multiples = (multiples.size > 0) ? multiples : [3, 5];
  end

  def to(num)
    (1...num).select do |current_num|
      any_multiple?(current_num)
    end.sum
  end

  private

  def any_multiple?(num)
    multiples.any? do |multiple|
      (num % multiple).zero?
    end
  end
end