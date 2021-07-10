class Clock
  attr_reader :hour, :minutes

  def initialize(hour, minutes=0)
    @hour = hour
    @minutes  = minutes
  end

  def self.at(hour, minutes=0)
    Clock.new(hour, minutes)
  end

  def ==(other)
    hour == other.hour && minutes == other.minutes
  end

  def to_s
    format("%02d:%02d", hour, minutes)
   end

   def +(min)
    new_time = time_in_minutes(min)
    Clock.new(((new_time/60)%24),(new_time%60))
   end

   def -(min)
    new_time = time_in_minutes(-min)
    Clock.new(((new_time/60)%24),(new_time%60))
   end

   def time_in_minutes(min)
    ((@hour*60)+@minutes+min) % 1440
   end
end
