class StartsAtFinder < DocumentSearcher
  def self.find_starts_at_on_expedia
    DateTime.parse uri_params['chkin']
  end
end