class TravelEvent < ApplicationRecord
  extend Enumerize

  belongs_to :plan

  enumerize :mode_of_transportation, in: [:car, :bus, :train, :bike, :walk]

  def duration_in_words
    data['routes'].first['legs'].first['duration']['text']
  end

  def duration_hash
    components = duration_in_words.split(' ')
    if duration_in_words.include? 'day'
      { days: components.first.to_i, hours: components.third.to_i }
    else
      { hours: components.first.to_i, minutes: components.third.to_i }
    end
  end
end
