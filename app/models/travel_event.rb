class TravelEvent < ApplicationRecord
  extend Enumerize

  before_save :set_arrival_time

  belongs_to :parent_event

  enumerize :mode_of_transportation, in: [:car, :bus, :train, :bike, :walk]

  def duration
    data['routes'].first['legs'].first['duration']['text']
  end

  protected
    def set_arrival_time
      api_key = Rails.application.secrets[:google_directions_api_key]
      response = Faraday.get "https://maps.googleapis.com/maps/api/directions/json?origin=#{origin}&destination=#{destination}&key=#{api_key}"
      self.data = JSON.parse(response.body)
    end
end
