class Element
  attr_reader :datum, :next

  def initialize(datum, next_elem = nil)
    @datum = datum
    @next = next_elem
  end

  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :head

  def size
    return 0 if head.nil?
    counter = 1
    current_elem = head
    until current_elem.tail?
      counter += 1
      current_elem = current_elem.next
    end
    counter
  end

  def empty?
    head.nil?
  end

  def push(datum)
    elem = Element.new(datum, head)
    @head = elem
  end

  def peek
    head.datum if head
  end

  def pop
    popped_elem = head
    @head = head.next
    popped_elem.datum
  end

  def self.from_a(arr)
    list = SimpleLinkedList.new
    if arr && !arr.empty?
      arr.reverse.each { |elem| list.push(elem) }
    end
    list
  end

  def to_a
    arr = []
    current_elem = head
    while !current_elem.nil?
      arr << current_elem.datum
      current_elem = current_elem.next
    end
    arr
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    current_elem = head
    while !current_elem.nil?
      reversed_list.push(current_elem.datum)
      current_elem = current_elem.next
    end
    reversed_list
  end
end
