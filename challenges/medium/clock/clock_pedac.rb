=begin
Problem
------------------------------------------
Clock
Create a clock that is independent of date.
Capabilities
- Add and subtract minutes
- Compare equality of times of two clock objects.

Inputs: 
Outputs: 

Rules/Requirements
- Cannot use built-in date or time functionality.

Examples, Test Cases
------------------------------------------


Data Structures, Classes, Modules + Algorithm
------------------------------------------
Class: Clock

Class Method: self.at(hours, minutes)
- minutes is an optional parameter, defaults to 0
- Returns an object of Clock.

Instance Method: to_s()
- Returns string in 'HH:MM' time format.
- Performs integer division: @min / 60
  - Quotient is the hours
  - Remainder is the minutes
- Zero-pad both hours and minutes to two characters. Perform string interpolation.

Instance Method: +(minutes) and -(minutes)
- Add or subtract minutes to @minutes.
- User helper method to normalize @minutes to between 0 and 1440

Instance Method: normalize
- If @minutes is < 0, add 1440 until it is >= 0.
- If @minutes is > 1440, subtract 1440 until it is <= 1440.
- If @minutes is == 1440, set to 0.

Instance Variable: @minutes
- Represents minutes past midnight


Algorithm and Sub-Problems
------------------------------------------
Written above

=end