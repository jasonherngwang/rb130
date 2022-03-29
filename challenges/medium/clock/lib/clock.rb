class Clock
  def initialize(hours, minutes)
    @minutes = hours * 60 + minutes
  end

  def self.at(hours, minutes=0)
    Clock.new(hours, minutes)
  end

  def +(additional_minutes)
    Clock.new(0, normalize(minutes + additional_minutes))
  end

  def -(less_minutes)
    Clock.new(0, normalize(minutes - less_minutes))
  end

  def ==(other_clock)
    minutes == other_clock.minutes
  end

  def to_s
    display_hours, display_minutes = minutes.divmod(60)
    format("%02d:%02d", display_hours, display_minutes)
  end

  protected

  attr_reader :minutes

  private

  def normalize(minutes)
    minutes += 1440 while minutes < 0
    minutes -= 1440 while minutes >= 1440
    minutes
  end
end
