class Diamond
  attr_reader :letter, :top_letters

  def initialize(letter)
    @letter = letter
    @top_letters = get_top_letters
  end

  def self.make_diamond(letter)
    Diamond.new(letter).make_diamond
  end

  def make_diamond
    letter_list = top_letters + letter.chars + top_letters.reverse

    letter_list.map do |char|
      outer = "#{' ' * (letter.ord - char.ord)}"
      if char == "A"
        "#{outer}#{char}#{outer}\n"
      else
        inner = "#{' ' * (((char.ord - 'B'.ord) * 2) + 1)}"
        "#{outer}#{char}#{inner}#{char}#{outer}\n"
      end
    end.join
  end

  private

  def get_top_letters
    ('A'..'Z').to_a.select do |char|
      char < letter
    end.sort
  end
end