class Anagram
  def initialize(word)
    @word = word
  end

  def match(candidates)
    candidates.select { |candidate| anagrams?(@word, candidate)}
  end

  private

  def anagrams?(word1, word2)
    word1 = word1.downcase
    word2 = word2.downcase

    word1.chars.tally == word2.chars.tally &&
    word1 != word2
  end
end