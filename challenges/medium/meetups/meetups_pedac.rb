=begin
Problem
------------------------------------------
Meetups
Meetups happen monthly on the same day of the week.

Create objects representing meetup dates.
- Month number: 1-12
- Year: e.g. 2021

Determine exact date of meeting in the specified month and year.

Descriptors (nth): first, second, third, fourth, fifth, last, teenth
- Case-insentitive

Day of week: Monday...Sunday
- Case-insensitive

Rules/Requirements
- 

Examples, Test Cases
------------------------------------------
2nd Wednesday of May 2021 => 12th of May, 2021

Data Structures, Classes, Modules
------------------------------------------
Class: Meetup

Constructor instance method: initialize(year, month)

Instance Variables: @year, @month

Instance Method: day(day_of_week, descriptor)
- Returns a Date object if inputs are valid, nil otherwise.

Algorithm and Sub-Problems
------------------------------------------
Create a hash for day of week. Keys are strings, values are methods.
{ 'Monday': :monday?, ... }

Create a hash for descriptor. Keys are strings, values are integers (Array indices).
{ 'first': 1 }

Given year, month, day_of_week, descriptor:
- Use hash to lookup method corresponding to day_of_week. Use capitalize.
- Use Date to create a Range containing all days in the month.
- Start with day 1
- End with day -1
- Filter Range to Dates matching day_of_week, using the method found from the hash.
- If descriptor is not 'teenth'
  - Use hash to lookup Integer corresponding to descriptor. Use downcase.
  - Find the Date at this index position in the array
  - Return this Date
- If descriptor is 'teenth'
  - Filter the array for Date where the day is between 13-19
  - Return the single element in this filtered array.
=end

require 'date'

DAY_OF_WEEK_METHODS = {
  'Monday' => :monday?, 'Tuesday' => :tuesday?, 'Wednesday' => :wednesday?, 
  'Thursday' => :thursday?, 'Friday' => :friday?, 'Saturday' => :saturday?, 
  'Sunday' => :sunday?
}

DESCRIPTOR_NUM = {
  'first' => 1, 'second' => 2, 'third' => 3, 'fourth' => 4, 'fifth' => 5
}

def find_date(year, month, day_of_week, descriptor)
  day_of_week_method = DAY_OF_WEEK_METHODS[day_of_week.capitalize]
  dates = Date.new(year, month, 1)..Date.new(year, month, -1)
  dates = dates.select { |date| date.send(day_of_week_method) }
  
  if descriptor != 'teenth'
    if descriptor == 'last'
      index = -1
    else
      index = DESCRIPTOR_NUM[descriptor.downcase] - 1
    end
    dates[index]
  else
    dates.select { |date| (13..19).include? date.day }.first
  end
end

p find_date(2013, 3, 'Monday', 'first') == Date.civil(2013, 3, 4)
p find_date(2014, 8, 'Wednesday', 'third') == Date.civil(2014, 8, 20)
p find_date(2016, 3, 'Monday', 'last') == Date.civil(2016, 3, 28)
p find_date(2017, 3, 'Saturday', 'teenth') == Date.civil(2017, 3, 18)