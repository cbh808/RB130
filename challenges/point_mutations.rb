=begin
Problem Statment (restate explicit reqs /identify implicit reqs)
Write a program that can calculate the Hamming distance between two DNA strands.

rules:
Hamming distance is differences between two homologous DNA strands 
taken from different genomes with a common ancestor

Hamming distance is only defined for sequences of equal length. 
If given have two sequences of unequal length, 
compute the Hamming distance over the shorter length.

input:
two capitalized strings representing DNA strands
output:
integer, number of differences when compared letter by letter

Examples / Test Case:
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
The Hamming distance between these two DNA strands is 7

class DNA: initialize with argument of DNA string in a constructor
  the constructor does not raise errors
method hamming_distance with argument of second DNA string
returns integer representing hamming distance

Data Structures:
input: strings
work with collection to iterate, compare lengths and compare elements one by one
output: integer

Algorithm:
define class DNA and assign dna argument to instance variable dna1
define method that takes one are
  - convert strings to arrays compare lengths of two strings
  - compare each element of array letter by letter
  - count each time letters are different
  - return difference
=end

class DNA
  def initialize(dna1)
    @dna1 = dna1
  end

  def hamming_distance(dna2)

    length = get_length(@dna1, dna2)
    counter = 0

    length.times do |idx|
      counter += 1 if @dna1[idx] != dna2[idx]
    end

    counter
  end

  def get_length(dna1, dna2)
    [dna1.length, dna2.length].min.to_i
  end


end