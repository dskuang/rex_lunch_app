class Date
  def self.upcoming_lunch_day
    today = Time.current.wday
    upcoming_day = today > 1 && today < 5 ? 'Friday' : 'Monday'
    date_of_next(upcoming_day)
  end

  class << self
    private

    def date_of_next(day)
      date  = Date.parse(day)
      delta = date > Time.zone.now.to_date ? 0 : 7
      date + delta
    end
  end
end
