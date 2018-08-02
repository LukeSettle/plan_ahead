class Plan < ApplicationRecord
  has_many :parent_events

  def total_time_in_words
    total_time = parent_events.map(&:total_time).sum
    days = total_time / 1.day
    hours = (days - days.to_i) * 100
    minutes = ((hours - hours.to_i) * 100) % 60
    "#{days.round} days, #{hours.round} hours, and #{minutes.round} minutes"
  end

  def total_price
    parent_events.map { |parent_event| parent_event.price.to_i }.sum
  end

  def events
    parent_events
  end
end
