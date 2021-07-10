=begin
Problem: 
covert octal number to decimal

input: string octal
output: decimal number

rules:
for decimal, the nth digit get multiplied by 10**(n-1)
sum of all values is the result

Example
432 in decimal
4*10**2 + 3*10**1 + 2*10**0
octals use power of 8

Test Cases
An Octal class is required
A constructor method takes a string argument representing octal
an instance method to_decimal is required for conversion
a string with non-octal characters returns 0
a string with leading 0 is valid

Data Structures
input as string and output as decimal number
potentially use array conversion to use built-in methods

Algorithm
return 0 if string has any characters not 0-7
covert string to integer (removes leading 0's)
reverse the digits in integer
create counter
increment counter by (digit * 8**index of current digit)
return counter
=end

class Octal
  attr_reader :octal

  def initialize(octal)
    @octal = octal
  end

  def to_decimal
    return 0 if octal.match?(/[^0-7]/)
    digits = octal.to_i.digits
    
    counter = 0
    digits.each_with_index do |digit, idx|
      counter += digit * (8 ** idx)
    end

    counter
  end
end