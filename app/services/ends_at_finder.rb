class EndsAtFinder < DocumentSearcher
  def self.find_ends_at_on_expedia
    DateTime.parse uri_params['chkout']
  end
end