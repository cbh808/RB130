class Meetup
  attr_reader :year, :month, :d

  WEEKDAY = {sunday: 0, monday: 1, tuesday: 2, wednesday: 3, thursday: 4, friday: 5, saturday: 6}
  
  def initialize(year, month)
    @year = year
    @month = month
  end

  def day(weekday, position)
    range = get_range(position, last_day_of_month)
    range.to_a.each do |num|
      next if !Date.valid_date?(year, month, num)
      if Date.new(year, month, num).wday == WEEKDAY[weekday.downcase.to_sym]
        return Date.new(year, month, num)
      end
    end
    nil
  end

  def get_range(position, last)
    case position.downcase
      when 'first'  then (1..7)
      when 'second' then (8..14)
      when 'third'  then (15..21)
      when 'fourth' then (22..28)
      when 'fifth'  then (29..31)
      when 'teenth'  then (13..19)
      when 'last'   then ((last-6)..last)
    end
  end

  def last_day_of_month
    last = 28
    (28..31).to_a.each do |num|
      last = num if Date.valid_date?(year, month, num)
    end
    last
  end
end