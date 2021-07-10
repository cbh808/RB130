=begin
The following list contains the names of individuals who are pioneers in the field of computing or that have had a significant influence on the field. 
The names are in an "encrypted" form Rot13.
Write a program that deciphers and prints each of these names .

Example
N => A

Data Structures:
Input Array of Names
  Convert name to array of characters
Output: printed strings

for each name
  convert to array of chars
  iterate over each letter
  mutate each char in place through reassignment
  join to new string
  output string
end

=end

ENCRYPTED_NAMES = [
'Nqn Ybirynpr',
'Tenpr Ubccre',
'Nqryr Tbyqfgvar',
'Nyna Ghevat',
'Puneyrf Onoontr',
'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
'Wbua Ngnanfbss',
'Ybvf Unvog',
'Pynhqr Funaaba',
'Fgrir Wbof',
'Ovyy Tngrf',
'Gvz Orearef-Yrr',
'Fgrir Jbmavnx',
'Xbaenq Mhfr',
'Fve Nagbal Ubner',
'Zneiva Zvafxl',
'Lhxvuveb Zngfhzbgb',
'Unllvz Fybavzfxv',
'Tregehqr Oynapu'
].freeze

def unencrypt(name_encrypted)
  name_encrypted.each_char.reduce('') do |memo, char|
    memo + get_character(char)
  end
end

def get_character(char)
  case char
  when 'a'..'m', 'A'..'M' then (char.ord + 13).chr
  when 'n'..'z', 'N'..'Z' then (char.ord - 13).chr
  else char
  end
end

ENCRYPTED_NAMES.each do |name_encrypted|
  puts unencrypt(name_encrypted)
end


