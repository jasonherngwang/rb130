=begin
Problem
------------------------------------------
Linked List
Implement a singly linked list. Each element contains data and a "next" field 
pointing to the next element in the list.

Provide functions to reverse the list and convert to/from an array.

Rules/Requirements
- 

Examples, Test Cases
------------------------------------------


Data Structures, Classes, Modules
------------------------------------------
Class: Element

Constructor instance method: initialize(datum, next_elem = nil)
- next_elem is optional, but can be passed another Element object
  - Assign @next_elem to Element object.

Instance Variables: @datum, @next

Public getter: datum()
- Returns @datum

Instance Method: tail?
- Returns true if @next is nil (this Element is the last element in the list)

Instance Method: next()
- Returns @next


Class: SimpleLinkedList

Constructor: initialize()
- Initialize @head to nil

Instance Variable: @head
- References the first Element

Instance Method: size
- Return size of linked list
- If @head is nil, return 0
- Else:
  - Create a counter starting at 1
  - Starting at the Element referenced by @head, move to the next element and increment the counter.
  - If the current element is the tail, then stop.
  - Return the counter

Instance Method: empty?
  - Return true if @head is nil

Instance Method: push(value)
- Create Element object
- Assign Element object's @next_elem variable to @head
- Assign linked list's @head to Element object.

Instance Method: peek
- Return datum of Element referenced by @head

Instance Method: pop
- Duplicate the variable @head.
- Reassign @head to the @next_elem object of @head.
- Return the duplicate of @head.

Class Method: from_a(arr)
- 

=end