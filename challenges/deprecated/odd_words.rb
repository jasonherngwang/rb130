=begin
Tips
- Don't underestimate and dive into code!
  - You may be missing tricky parts.
- Read description 3 times. Make an outline while reading.
- Communicate and clarify. Ask questions.
- Test cases: Some may be given
  - Happy paths:
  - Fail paths: 
  - Edge cases: emptiness, nil, etc. Boundaries.
- Write an algorithm
- Manage energy
  - Tackle difficult part first.
- Abstractions
  - Isolate parts of the problems.

Problem
---------------------
Character set:
- letters (lowercase?)
- a space
- a point
- Ask about invalid input.
- Input edge cases: "", ".", " hello . "

Words are: 1-20 letters
- Can it be >20 letters?

Input text is:
- 1+ words
- Separated by 1+ spaces
- Terminated by 0+ spaces, followed by a point.
  - Last char is a point

Output text is:
- Successive words are separated by 1 space
- Last word terminated by a single point.

Odd words are copied in reverse order.
- "Odd" starts at the 2nd word in the string (index 1).
Even words are echoed.

Questions
--------------------------

Test Cases
------------------------
Input:  "whats the matter with kansas"
Output: "whats eht matter htiw kansas"

Input:  "i am the walrus  ."
Output: "i ma the surlaw."



Bonus
--------------------------
Characters must be read and printed 1 at a time.
- No regex.
- Only walk through the input once.
- No splitting.
- No squeezing spaces

Data structures
-----------------------------
If reading and printing 1 char at at time, can't split the string into an array 
of words or characters.
- Must create a set of conditionals.

Algorithm
---------------------------
Create an output string, or simply print each char to the screen as we read 
the input string.

Notes
- Create a Boolean toggle of whether the current word is an odd or even word.

Conditionals
- If current char is a letter
  - If previous char is a letter
    - If current word is odd
      - Add the letter before the previous letter, e.g. at index -2
    - If current word even
      - Add the letter to the end of the result string.

- If current char is a space
  - If previous char is also a space, skip this character.
  - If previous char is empty, skip this character.
  - If next char is space, skip this character.
  - If next char is period, skip this character.
  - If next char is a letter, add this space to the result string.

- If current char is a period, this is the last char in the string.

Algorithm
- Create a variable to store the last character that was output.
- Create a variable (boolean) as a flag for if the current word is odd.
- Iterate through each character of the input string.
  - Use the conditionals to determine whether to skip a character or output it.
  =end

  def odd_words