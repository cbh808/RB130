=begin
Problem:
Generate the lyrics of the 99 Bottles of Beer song.
See the test suite for the entire song.

Test Cases:
generate a BeerSong class
generate a class method `verse` that take one argument, the verse to be returned
generate a class method `verses` that take two arguments
  - start verse and end verse
  - returns all verses from start verse to end verse
generate a class method `lyrics` that returns entire song
generate method get_verses to return correct verses

Data Structures
song is string
can be stored as list of verses
the verse number represented by the index of list

Algorithm:


class method `verse`
  - create verse of arg calling helper method `return_verses` (pass in two args, start and finish)

class metod `verses`
  - extract array values at range of verses from begin upto and including end

class method `lyrics` that returns entire song

method return_verses
  - take two args, start and finish, if only one verse then start/end are equal
  - use if else statement to return verse 1 to 98, verse 99(1 bottle), or verse 100(0 bottles)
=end

class BeerSong
  def self.verse(num)
    get_verses(num, num)
  end

  def self.verses(start, finish)
    get_verses(start, finish)
  end

  def self.lyrics
    self.get_verses(99, 0)
  end

  def self.get_verses(start, finish)
    verses = []

    start.downto(finish) do |bottles|
      if bottles > 2 && bottles < 100
        verses << normal_verse(bottles) #"#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
        #"Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n" \
      elsif bottles == 2
        verses << "2 bottles of beer on the wall, 2 bottles of beer.\n" \
        "Take one down and pass it around, 1 bottle of beer on the wall.\n" \
      elsif bottles == 1
        verses << "1 bottle of beer on the wall, 1 bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n" \
      else
        verses << "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
      end
    end
    verses.join("\n")
  end

  def self.normal_verse(bottles)
    "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\n" \
    "Take one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n" \
  end

end
