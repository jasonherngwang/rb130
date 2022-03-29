class DNA
  attr_reader :strand

  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other_strand)
    min_length = [strand, other_strand].map(&:size).min
    return 0 if min_length == 0

    mutations = 0
    (0...min_length).each do |idx|
      mutations += 1 if strand[idx] != other_strand[idx]
    end
    mutations
  end
end