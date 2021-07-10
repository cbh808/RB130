=begin
Problem Statment (restate explicit reqs /identify implicit reqs)
convert modern decimal numbers into their Roman number equivalents.


rules:
I means 1, II means 2, III means 3
V = 5, X = 10, L = 50
C= 100, D = 500, M = 1000
placing any smaller number in front of any larger number — indicates subtraction

input: integer year
output: string representing roman numeral 

Examples / Test Case:
1990 is MCMXC  
  => 1990 = 1000 + 900 + 90


General approach using 0 through 9
  does number have roman numeral equivalent (RNE), i.e. equal to 1 or 5?
    y => add that number to back of roman numeral collection
  
    n => check case
      for each digit iterating over index
      x = ROM_NUM[digit]
      x5 = ROM_NUM[digit * 5]
      x10 = ROM_NUM[digit*10]
      digit = 10**(length-1-idx)
        if put digits in reverse order, digit = 10**idx, then prepend below instead of append


      if 0, next
      if 1...4 then append `x` * num  to collection
      if 4...5 then append x  AND append x5
      if 5     then append x5
      if 6...9 then append x5 AND append 'x' * (num - 5)
      if 9     then append x AND append 

class RomanNumeral takes 1 arg, a year in decimal

Data Structures:
input: integer
to determine if a number is higher or lower store in a collection, e.g. hash
collect roman numerals in an array
output: string

Algorithm:
pass in num to conversion method
convert num to their digits and iterate over each
run case statement to prepend correct roman numeral for each digit
return roman numberal as string
=end

class RomanNumeral
  attr_reader :num
  
  ROM_NUM = {1=>'I', 5=>'V', 10=>'X', 50=>'L', 100=>'C', 500=>'D', 1000=>'M'}
  
  def initialize(num)
    @num = num
    raise ArgumentError.new "Integer must be between 1 and 3999" unless valid?
  end

  def to_roman
    digits = @num.digits
    romans = []

    digits.each_with_index do |num, idx|
      digit = 10 ** idx
      romans.prepend(get_romans(num, idx, digit))
    end

    romans.join
  end
  
  def get_romans(num, idx, digit)
    string = ''
  
    x   = ROM_NUM[digit]
    x5  = ROM_NUM[digit * 5]
    x10 = ROM_NUM[digit * 10]
    
    case num.to_i
      when 0
        ''
      when 1...4
        string << x * num
      when 4...5
        string << x
        string << x5
      when 5
        string << x5
      when 6...9
        string << x5
        string << x * (num - 5)
      when 9
        string << x
        string << x10
      end

    string
  end

  def valid?
    @num.class == Integer && (1..3999).include?(@num)
  end
end

input = RomanNumeral.new(3999)
# # p input.num
# # p RomanNumeral::ROM_NUM['1']
p input.to_roman