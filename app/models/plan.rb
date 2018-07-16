class Plan < ApplicationRecord
  has_many :events

  def total_time
    events.map(&:total_time).sum
  end
end
