=begin
Problem
Given a string of digits
return all the possible consecutive number series of a specified length in that string.

inputs string, representing digits
output array, with subarrays representing consecutive number series

Example
string "01234" has the following 3-digit series:
012
123
234
=> [[0, 1, 2], [1, 2, 3], [2, 3, 4]]

Likewise, here are the 4-digit series:
0123
1234

Rules:
if asked for a 6-digit series from a 5-digit string, throw an error.

Test Cases:
generate class `Series`
constructor that takes one argument, the input string of digits
  - to be assigned to an instance variable
instance method `slices` that takes argument, size of substrings to be returned
must throw error for invalide slice arg, too long compared to input string

Data Structures:
input string to be converted to array and slices taken from array
return array with subarrays as elements

Algorithm:
Series (class)
  create constructor
    assign value of argument to intance variable `input`

  slices (instance method)
    - takes argument of substring size
    - throw ArgumentErrror error if arg > substring length
    - convert string to array
    - iterate over array from index 0 to (string length - substring length)
      - e.g. array size = 3, substring length 1;  3-1 = 2 == max start idx to iterate to
    - take slice of array and append to new result array
    - return result array
=end

class Series
  attr_reader :digits
  def initialize(digits)
    @digits = digits
  end

  def slices(substring_size)
    result = []
    raise ArgumentError.new if substring_size > digits.length

    chars = digits.chars.map(&:to_i)
      0.upto(digits.length - substring_size) do |s_idx|
        substring = chars[s_idx, substring_size]
        result << substring
      end
    result
  end
end