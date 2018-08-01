class Plan < ApplicationRecord
  has_many :events

  def total_time_in_words
    total_time = events.map(&:total_time).sum
    days = total_time / 1.day
    hours = (days - days.to_i) * 100
    minutes = ((hours - hours.to_i) * 100) % 60
    "#{days.round} days, #{hours.round} hours, and #{minutes.round} minutes"
  end

  def total_price
    events.map { |event| event.price.to_i }.sum
  end
end
