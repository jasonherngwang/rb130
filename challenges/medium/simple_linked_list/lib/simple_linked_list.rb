class Element
  attr_reader :datum

  def initialize(datum, next_elem = nil)
    @datum = datum
    @next_elem = next_elem
  end

  def tail?
    @next_elem.nil?
  end

  def next
    @next_elem
  end
end

class SimpleLinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

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
    @head.nil? ? nil : @head.datum
  end

  def pop
    popped_elem = head
    @head = head.next
    popped_elem.datum
  end
end