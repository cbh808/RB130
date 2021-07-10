=begin
Problem Statment (restate explicit reqs /identify implicit reqs)
Write a program to determine whether a triangle is
equilateral, isosceles, or scalene.

rules:
An equilateral triangle has all three sides the same length.
An isosceles triangle has exactly two sides of the same length.
A scalene triangle has all sides of different lengths

For a shape to be a triangle, all sides must be of length > 0
the sum of lengths of any 2 sides must be > than the length of 3rd side.

input:
output:

Examples / Test Case:
The provided test cases indicate that we need a Triangle class. 
the class must have the following two methods:
a constructor that accepts three arguments representing three side lengths.
  -an exception is raised in the constructor if any side length is <= 0.
  -an exception is raised if the side lengths taken together don't describe a valid triangle
a method `kind` returns a string representing the type of the triangle.

We may want to create some helper methods to assist, but are optional.

Data Structures:
input:
output:

Algorithm:

=end

class Triangle
  def initialize(a, b, c)
    @side_a = a
    @side_b = b
    @side_c = c
    raise ArgumentError.new("Triangle side length < 0") if a <= 0 || b <= 0 || c <= 0
    raise ArgumentError.new("Not a Triangle!") if !valid_triangle?
  end

  def kind
    return "equilateral" if equilateral?
    return "isosceles" if isosceles?
    return "scalene"
  end

  def valid_triangle?
    sorted = [@side_a, @side_b, @side_c].sort!
    sorted.first(2).sum > sorted.last
  end

  def equilateral?
    @side_a == @side_b && @side_b == @side_c
  end

  def isosceles?
    @side_a == @side_b || @side_b == @side_c || @side_a == @side_c
  end

end