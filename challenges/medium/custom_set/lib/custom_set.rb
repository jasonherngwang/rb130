class CustomSet
  attr_reader :set

  def initialize(array = [])
    @set = array.uniq
  end

  def empty?
    set.empty?
  end

  def contains?(elem)
    set.include? elem
  end

  def subset?(other)
    difference(other).empty?
  end

  def disjoint?(other)
    difference(other) == self
  end

  def ==(other)
    set - other.set == other.set - set
  end

  def eql?(other)
    self == other
  end

  def add(elem)
    set << elem unless contains? elem
    self
  end

  def intersection(other)
    CustomSet.new(set & other.set)
  end

  def difference(other)
    CustomSet.new(set - other.set)
  end

  def union(other)
    CustomSet.new(set | other.set)
  end
end
