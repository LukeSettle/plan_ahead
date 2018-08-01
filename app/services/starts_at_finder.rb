class StartsAtFinder < DocumentSearcher
  def find_starts_at_on_expedia
    uri_params['chkin']
  end
end