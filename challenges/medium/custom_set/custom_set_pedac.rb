=begin
Problem
------------------------------------------
Custom Set
Define your own set type. Do not use the built-in Set type.
All elements are numbers.
Ruby Docs: collection of unordered values with no duplicates. It is a hybrid of 
Array's intuitive inter-operation facilities and Hash's fast lookup.


Data Structures, Classes, Modules
------------------------------------------
Class: CustomSet

Constructor initialize(arr)
- Parameters: Nothing, or an Array of numbers
- Instance variable: @set
  - Default value is empty Array, if not Array given.
- Performs validation to remove duplicates (find unique).

Instance methods
empty?()
- Returns true if set is empty, false if not.

contains?(num)
- Returns true if num is in the set, false if not.

subset?(other_set)
- Parameter is another CustomSet object
- Returns true if all elements of set are contained in other_set's set.
- Empty array is is a subset of ANY other set (empty or not).

disjoint?(other_set)
- Returns true if set and other_set have no elements in common.
- If either set is empty, returns true since empty has nothing in common with anything.

eql?(other_set)
- Override Object#eql? default implementation which checks hash key equality.
- Return true if both set are empty, or if both set have the same UNIQUE elements.
  - OK to have duplicates.

add(num)
- Add num to the set
- Perform uniqueness validation

intersection(other_set)
- Return a new CustomSet object having a set that:
  - Contains elements COMMON TO both sets.
- If one set is empty, or there are no elements in common, the returned object will have an empty set.

difference(other_set)
- Return a new CustomSet object having a set that:
  - The first set has, but the second set doesn't, i.e. [] - [].

union(other_set)
- Return a new CustomSet object having a set that:
  - Contains elements in both sets. Need to check for

=end