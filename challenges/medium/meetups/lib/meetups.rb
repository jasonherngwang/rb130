require 'date'

class Meetup
  DAY_OF_WEEK_METHODS = {
    'Monday' => :monday?, 'Tuesday' => :tuesday?, 'Wednesday' => :wednesday?,
    'Thursday' => :thursday?, 'Friday' => :friday?, 'Saturday' => :saturday?,
    'Sunday' => :sunday?
  }

  DESCRIPTOR_INDEX = {
    'first' => 0, 'second' => 1, 'third' => 2, 'fourth' => 3, 'fifth' => 4,
    'last' => -1
  }

  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(day_of_week, descriptor)
    day_of_week_method = DAY_OF_WEEK_METHODS[day_of_week.capitalize]

    dates = Date.new(@year, @month, 1)..Date.new(@year, @month, -1)
    dates = dates.select { |date| date.send(day_of_week_method) }

    if descriptor != 'teenth'
      dates[DESCRIPTOR_INDEX[descriptor.downcase]]
    else
      dates.select { |date| (13..19).include? date.day }.first
    end
  end
end
