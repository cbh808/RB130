
=begin
Problem Statment (restate explicit reqs /identify implicit reqs)
Write a program that takes a word and a list of possible anagrams 
and selects the correct sublist that contains the anagrams of the word.

rules:
anagram comparisons are case-insensitive
collection of anagrams should be returned with original capitalisation of candidate
anagram collection may not repeat a word (eg SWORD and sword are the same)
the same word for given word and anagram candidate cannot be same
input:
output:

Examples / Test Case:
For example, given the word "listen" and a list of candidates like "enlists", 
"google", "inlets", and "banana", the program should return a list containing 
"inlets". Please read the test suite for the exact rules of anagrams.

Data Structures:
input: string
output: subcollection taken from collection of candidate anagrams 

Algorithm:
create Anagram class with constructor assigning word in lowercase to instance variable
create match class to accept a collection of potential anagram candidates
iterate over collection of candidates  
check in helper method if each word anagram (pass in current cadidate in lowercase and word)
  Y: add original candidate to array of anagrams
  return collection (array) of anagrams or empty array

anagram helper method
  compare lowercase candidate to lowercase word and return nil if same
  convert candidate and word to character arrays, sort them and see if equivalent
  Y: return true, N: return false
=end

class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(word_collection)
    anagrams = []
    word_collection.each do |candidate|
      anagrams << candidate if anagram?(candidate.downcase)
    end
    anagrams.uniq
  end

  def anagram?(candidate)
    return if candidate == @word
    candidate.chars.sort == @word.chars.sort
  end
end