class TitleFinder < DocumentSearcher
  def find_title_on_tripadvisor
    find_element_by_id('HEADING').text
  end

  def find_title_on_expedia
    find_element_by_id('hotel-name').text
  end
end