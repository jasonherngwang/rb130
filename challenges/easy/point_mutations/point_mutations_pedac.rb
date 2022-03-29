=begin
Problem
------------------------------------------
Point Mutations
Write a program that can calculate the Hamming distance between two DNA strands.
Mutations are mistakes during creation or copying.
A point mutation replaces one base with another, as a single location.
The Hamming distance is the total number of differences between two strands.

Inputs: 2 Strings representing strands.
Outputs: 1 Integer

Rules/Requirements
- Strings contains uppercase letters: A, C, T, or G
- If the strings have different lengths, compute the Hamming distance over the
  shorter length.
- If 1 or both strings are empty, return 0

Clarifying Questions
- NO NEED to perform input validation to check for:
  - Non-ACTG characters
  - Lowercase letters
  - Non-letters
  - Spaces, punctuation

Examples, Test Cases
------------------------------------------
Case: Typical case
GAGCCTACTAACGGGAT
CATCGTAATGACGGCCT
^ ^ ^  ^ ^    ^^
Hamming distance: 7

Case: One string shorter
GAGCCTACTAACGGGAT
CATCGTAAT
^ ^ ^  ^ 
Hamming distance: 4

Case: No difference
GAGCCTACTAACGGGAT
GAGCCTACTAACGGGAT

Hamming distance: 0

Data Structure, Algorithm
------------------------------------------
Pre-processing
- If either string is empty, return 0
- Trim both string to the length of the shorter string, if applicable

Algorithm
- Initialize empty array: `mutations`
- Iterate over the chars in the first string, keeping track of the index
  - Compare chars from both string, at current index
    - If same, append Boolean false to `mutations`
    - If different, append Boolean true to `mutations`
- Filter `mutations` to true objects only, and return Array size.

Optional functionality
- Transform `mutations` array by mapping:
  - false => ' '
  - true  => '^'
- Print both strings.
- Print `mutations`

=end

# First attempt
def hamming_distance(strand1, strand2)
  return 0 if strand1.empty? || strand2.empty?
  
  strand1, strand2 = [strand1, strand2].sort_by { |strand| strand.size }
  
  mutations = []
  strand1.each_char.with_index do |char, idx|
    mutations << (char == strand2[idx] ? false : true)
  end

  puts strand1, strand2
  puts mutations.map { |bool| bool ? '^' : ' ' }.join

  (mutations - [false]).size
end

# Simplified version
def hamming_distance(strand, other_strand)
  return 0 if strand.empty? || other_strand.empty?
  
  min_length = [strand, other_strand].map(&:size).min
  
  mutations = 0
  (0...min_length).each do |idx|
    mutations += 1 if strand[idx] != other_strand[idx]
  end

  mutations
end

p hamming_distance('', 'CATCGTAATGACGGCCT')
p hamming_distance('GAGCCTACTAACGGGAT', 'CATCGTAATGACGGCCT')
p hamming_distance('GAGCCTACTA', 'CATCGTAATGACGGCCT')
