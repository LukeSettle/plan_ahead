class EndsAtFinder < DocumentSearcher
  def find_ends_at_on_expedia
    uri_params['chkout']
  end
end