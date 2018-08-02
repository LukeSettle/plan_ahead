class Plan < ApplicationRecord
  has_many :travel_events

  def total_time_in_words
    # total_time = parent_events.map(&:total_time).sum
    # days = total_time / 1.day
    # hours = (days - days.to_i) * 100
    # minutes = ((hours - hours.to_i) * 100) % 60
    # "#{days.round} days, #{hours.round} hours, and #{minutes.round} minutes"
    ""
  end

  def total_travel_time
    travel_durations = travel_events.map(&:duration_hash)
    total_days = 0.days
    total_hours = 0.hours
    total_minutes = 0.minutes

    travel_durations.each do |duration|
      binding.pry
      total_days += duration[:days].to_i.days
      total_hours += duration[:hours].to_i.hours
      total_minutes += duration[:minutes].to_i.minutes
    end

    { days: total_days, hours: total_hours, minutes: total_minutes }
  end

  def total_price
    # parent_events.map { |parent_event| parent_event.price.to_i }.sum
    1
  end

  def events
    TravelEvent.where(plan_id: id)
  end
end
