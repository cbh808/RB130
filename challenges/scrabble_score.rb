=begin
Problem Statment (restate explicit reqs /identify implicit reqs)
Write a program that, given a word, computes the Scrabble score for that word.

Letter Values / Tile scores:
A, E, I, O, U, L, N, R, S, T	1
D, G	2
B, C, M, P	3
F, H, V, W, Y	4
K	5
J, X	8
Q, Z	10

rules:
How to Score
Sum the values of all the tiles used in each word. 


input: string word
output: integer score

Examples / Test Case:
For CABBAGE:
3 points for C
1 point for each A (there are two)
3 points for B (there are two)
2 points for G
1 point for E
Thus, to compute the final total (14 points), we count:

3 + 2*1 + 2*3 + 2 + 1
=> 3 + 2 + 6 + 3
=> 5 + 9
=> 14

Data Structures:
input: string word (can be empty, nil, or escaped characters within string)
lookup table for each letter
  -could be hash, or
  -array with letters included at index corresponding to score
output: integer, decoded score

Algorithm:
return 0 if input string nil
if string contains non-alphabetic character return 0
put strings of characters into corresponding index of an array
initialize a counter to 0
iterate over each character and increment counter by idx of array in which character is found
=end

class Scrabble
  LETTER_VALUES = ['', 'aeioulnrst', 'dg', 'bcmp', 'fhvwy', 'k', '', '', 'jx', '', 'qz']
  attr_reader :word

  def initialize(string)
    @word = string ? string : ''
  end

  def self.score(string)
    Scrabble.new(string).score
  end

  def score
    return 0 if word.downcase.match?(/[^a-z]/)
    tally = 0

    word.chars.each do |char|
      tally += get_value(char)
    end
    tally
  end

  def get_value(char)
    LETTER_VALUES.each_with_index do |letters, idx|
      return idx if letters.include?(char.downcase)
    end
  end
end