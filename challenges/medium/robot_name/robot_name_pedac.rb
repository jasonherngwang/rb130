=begin
Problem
------------------------------------------
Robot Name
Write a program that manages robot factory settings.
Robots generate a random name upon first boot-up.
Resetting a robot wipes their name.

Inputs: None
Outputs: None

Rules/Requirements
- When a new name is generated, it should not be the same as any name 
  generated in the past, for any robot.

Examples, Test Cases
------------------------------------------


Data Structures, Classes, Modules
------------------------------------------
Class: Robot

Constructor instance method: initialize()
- Generates a random name (@name) upon object instantiation.
- Name pattern: /^[A-Z]{2}\d{3}$/

Public getter method: name()
- Returns name

Public instance method: reset()
- Generates a new name.

Class variable: all_names (Array)

Algorithm and Sub-Problems
------------------------------------------
Method: Generate name
- Sample 2 letters from A..Z
- Sample 3 digits from 0-9
- Join all 5 characters
- Check if name is in robot_names Array. If so, generate another name.

=end