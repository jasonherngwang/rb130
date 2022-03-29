class Diamond
  def self.create_row(letter, row_width)
    return letter if row_width == 1
    "#{letter}#{' ' * (row_width - 2)}#{letter}"
  end
  
  def self.make_diamond(letter)
    start_letter = letter =~ /[A-Z]/ ? 'A' : 'a'
    letters = [*start_letter..letter]
    letters += letters[0...-1].reverse
    diamond_width = letters.size
  
    widths = (1..diamond_width).step(2).to_a
    widths += widths[0...-1].reverse
  
    letters.zip(widths).map do |letter, width|
      create_row(letter, width).center(diamond_width) + "\n"
    end.join
  end
end