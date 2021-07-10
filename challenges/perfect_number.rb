=begin
Problem Statment
Write a program that can tell whether a number is perfect, abundant, or deficient.

rules:
classify based on comparison between the number and the sum of its positive divisors
excluding the number itself, 
e.g. positive divisors of 15 are 1, 3, and 5. This sum is known as the Aliquot sum.

Perfect numbers have an Aliquot sum that is equal to the original number.
Abundant numbers have an Aliquot sum that is greater than the original number.
Deficient numbers have an Aliquot sum that is less than the original number.

Examples:
6 is a perfect number since its divisors are 1, 2, and 3, and 1 + 2 + 3 = 6.
28 is a perfect number since its divisors are 1, 2, 4, 7, and 14 and 1 + 2 + 4 + 7 + 14 = 28.
15 is a deficient number since its divisors are 1, 3, and 5 and 1 + 3 + 5 = 9 which is less than 15.
24 is an abundant number since its divisors are 1, 2, 3, 4, 6, 8, and 12 and 1 + 2 + 3 + 4 + 6 + 8 + 12 = 36 which is greater than 24.
Prime numbers 7, 13, etc. are always deficient since their only divisor is 1.

Test Cases
A class PerfectNumber needs to be created
A class method `classify` will be called with integer argument 

Data Structures:
input: call to class method with integer
output: type of natural number if positive integer, otherwise raise error

Algorithm:
create class method that takes an integer argument
find all divisors of number up to int/2
add to collection and sum them up
compare sum to integer and output type as string
=end

class PerfectNumber
  def self.classify(int)
    raise StandardError.new "Integer must be > 0" if int <= 0
    sum_of_divisors = find_divisors(int).sum
    return "perfect" if sum_of_divisors == int
    sum_of_divisors < int ? "deficient" : "abundant"
  end

  class << self
    private

    def find_divisors(int)
      divisors = [1]
      2.upto(int - 1) do |num|
        divisors << num if int%num == 0
      end
      divisors
    end
  end
end

p PerfectNumber.classify(24)