=begin
Problem
------------------------------------------
Anagrams
Write a program that takes a word and a list of possible anagrams and selects 
the correct sublist that contains the anagrams of the word.

Anagrams: Words with the same letters, but in different order
- Identical word is not anagram.
- All anagrams must be same length.

Inputs: 1 String and 1 Array of Strings
Outputs: 1 Array of Strings

Rules/Requirements
- Return empty Array if no matches in list.
- Possible to have more than 1 anagram in list.
- Case-insensitive

Clarifying Questions
- 

Examples, Test Cases
------------------------------------------
Inputs:
- String: "listen"
- Array: ["enlists", "google", "inlets", "banana"]
Output: ["inlets"]

Data Structure, Algorithm
------------------------------------------
Helper method: Determine if 2 strings are anagrams.
- Downcase both strings.
- Split each string into an array of characters.
- Tally both array.
- Check if both arrays are equal.
- Return a boolean

Iterate through the given list, to perform filtering.
- Keep the word if it is an anagram of the given string.
  - Invoke the helper method
- Return the filtered list.

=end

def anagrams(word1, word2)
  word1 = word1.downcase
  word2 = word2.downcase
  word1.chars.tally == word2.chars.tally &&
  word1 != word2
end

p anagrams('listen', 'SILENT')
p anagrams('', 'SILENT')
p anagrams('corn', 'corn')

def find_anagrams(word, candidates)
  candidates.select { |candidate| anagrams(word, candidate)}
end

p find_anagrams('ant', %w(tan stand at ant))